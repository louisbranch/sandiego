class ApplicationController < ActionController::Base
  protect_from_forgery

	rescue_from Koala::Facebook::APIError do
    @oauth = Koala::Facebook::OAuth.new
    redirect_to @oauth.authorize_url
  end

end

