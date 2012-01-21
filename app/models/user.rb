class User < ActiveRecord::Base
  has_many :missions, :dependent => :destroy
  has_many :messages
  belongs_to :rank

  validates :facebook_id, :presence => true
  validates :oauth_token, :presence => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true
  validates :rank, :presence => true

  default_scope :order => 'xp DESC'

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

  def checkins
    graph = Koala::Facebook::API.new(oauth_token)
    graph.get_connections('me','checkins')
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
      raise 'A valid friend couldn\'t be found.'
    end
  end

  def self.authenticate(signed_request)
    oauth = Koala::Facebook::OAuth.new
    signed_request = oauth.parse_signed_request(signed_request)
    user = find_by_facebook_id(signed_request['user_id'])
    unless user
      user = create_facebook_user(signed_request['oauth_token'])
    end
    unless user.oauth_token == signed_request['oauth_token']
      user.oauth_token = signed_request['oauth_token']
      user.save
    end
    user
  end

  def increase_xp(value)
    self.xp ||= 0
    self.xp += value
    update_rank
    self.save
  end

  def next_rank
    next_rank = rank.position + 1
    Rank.find_by_position(next_rank)
  end

  def xp_for_next_rank
    next_rank.minimum_xp - xp
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

  def update_rank
    if xp >= next_rank.minimum_xp
      self.rank = next_rank
    end
  end
end
