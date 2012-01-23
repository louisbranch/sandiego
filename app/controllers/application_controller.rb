#encoding: UTF-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :create_body_identifiers

  rescue_from Koala::Facebook::APIError do
    @oauth = Koala::Facebook::OAuth.new
    render 'canvas/new'
  end

  rescue_from Progress::OverTime do
    mission = Mission.find(params[:mission_id])
    redirect_to mission_path(mission)
  end

  rescue_from User::Invalid do
    redirect_to canvas_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => 'Acesso restrito.'
  end

  def current_user
    begin
      User.find(session[:user_id])
    rescue
      raise User::Invalid
    end
  end

  def create_body_identifiers
    @body_class = params[:controller]
    @body_id = params[:action]
  end

end
