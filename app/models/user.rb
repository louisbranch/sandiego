class User < ActiveRecord::Base
  has_many :missions, :dependent => :destroy
  belongs_to :rank

  validates :facebook_id, :presence => true
  validates :oauth_token, :presence => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true
  validates :rank, :presence => true

  def name
    "#{first_name} #{last_name}"
  end

  def friends
    graph = Koala::Facebook::API.new(oauth_token)
    graph.get_connections('me','friends')
  end

  def friend(id)
    graph = Koala::Facebook::API.new(oauth_token)
    graph.get_object(id)
  end

  def random_friend
    friend(friends.sample['id'])
  end

  def valid_random_friend(f = nil)
    f ||= friends
    unless f.empty?
      random_friend_id = f.slice!(rand(f.length - 1))['id']
      if friend(random_friend_id).size > 15 # 8 attributes sent by Facebook are not relevant for this game
        friend(random_friend_id)
      else
        valid_random_friend(f)
      end
    else
      raise 'A valid friend coun\'t be found.'
    end
  end

  def self.authenticate(signed_request)
    oauth = Koala::Facebook::OAuth.new
    signed_request = oauth.parse_signed_request(signed_request)
    user = find_by_facebook_id(signed_request['user_id'])
    unless user
      user = create_facebook_user(signed_request['oauth_token'])
    end
    user.oauth_token = signed_request['oauth_token'] # Refactor, is it still necessary?
    user
  end

  def increase_xp(value)
    self.xp ||= 0
    self.xp += value
    self.save
  end

  private

  def self.create_facebook_user(oauth_token)
    graph = Koala::Facebook::API.new(oauth_token)
    me = graph.get_object('me')
    User.create(
      :facebook_id => me['id'],
      :oauth_token => oauth_token,
      :first_name => me['first_name'],
      :last_name => me['last_name'],
      :email => me['email'],
      :rank => Rank.first,
    )
  end

end
