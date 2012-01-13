#encoding: UTF-8
class MissionsController < ApplicationController

  def index
    @missions = current_user.missions
  end

  def show
    @mission = Mission.find(params[:id])
    @city = @mission.current_city
  end

  def create
    mission = current_user.missions.build
    if mission.save
      redirect_to mission_path(mission)
    else
      redirect_to root_path, :alert => "Não foi possível criar a missão!"
    end
  end

  def map
    @mission = Mission.find(params[:id])
    @city = @mission.current_city
    @tracks = @mission.possible_tracks
  end

  def progress
    @mission = Mission.find(params[:id])
    @progress = @mission.progress
    if @progress.update_attributes(:track_id => params[:track_id])
      redirect_to mission_path(@mission)
    else
      redirect_to map_mission_path(@mission), :alert => "Não foi possível viajar para esta missão!"
    end
  end

end
