class User < ActiveRecord::Base
  after_create :create_first_missions
  has_many :missions, :dependent => :destroy
  belongs_to :rank

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
      if friend(random_friend_id).size >= 13
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
    user.oauth_token = signed_request['oauth_token']
    user
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
    )
  end

  def create_first_missions
    self.missions.create_first_missions(2)
  end

end

