class ApplicationController < ActionController::Base
  protect_from_forgery

	rescue_from Koala::Facebook::APIError do
    @oauth = Koala::Facebook::OAuth.new
    render 'canvas/new'
  end

  def current_user
    User.find(session[:user_id])
  end

end

