class User < ActiveRecord::Base
  attr_accessor :oauth_token

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
      :first_name => me['first_name'],
      :last_name => me['last_name'],
      :email => me['email']
    )
  end
end

