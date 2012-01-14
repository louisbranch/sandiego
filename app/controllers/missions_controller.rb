#encoding: UTF-8
class MissionsController < ApplicationController

  def index
    @missions = current_user.missions
  end

  def show
    @mission = Mission.find(params[:id])
  end

  def create
    mission = current_user.missions.build
    if mission.save
      redirect_to mission_path(mission)
    else
      redirect_to root_path, :alert => "Não foi possível criar a missão!"
    end
  end

end
