class MissionsController < ApplicationController

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
    @mission = Mission.find(params[:id])
  end

end
