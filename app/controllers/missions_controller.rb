class MissionsController < ApplicationController
  load_and_authorize_resource

  def index
    @missions = current_user.missions
    if @missions.any?
      render :index
    else
      mission = current_user.missions.create
      redirect_to mission_path(mission)
    end
  end

  def show
    @user = current_user
    @mission = Mission.find(params[:id])
    @headline = @mission.headline
    @messages = @mission.messages
  end

  def create
    mission = current_user.missions.create
    redirect_to mission_path(mission)
  end

end
