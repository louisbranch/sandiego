class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :create_body_identifiers

  rescue_from Koala::Facebook::APIError do
    @oauth = Koala::Facebook::OAuth.new
    render 'canvas/new'
  end

  rescue_from Progress::OverTime do
    mission = Mission.find(params[:mission_id])
    redirect_to mission_path(mission), :alert => 'Seu tempo acabou! :('
  end

  def current_user
    User.find(session[:user_id])
  end

  def create_body_identifiers
    @body_class = params[:controller]
    @body_id = params[:action]
  end

end
