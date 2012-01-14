#encoding: UTF-8
class TracksController < ApplicationController
  before_filter :load_mission

  def index
    @city = @mission.current_city
    @tracks = @mission.possible_tracks
  end

  def show
    @progress = @mission.progress
    @track = Track.find(params[:id])
    if @progress.update_attributes(:track => @track)
      render :show
    else
      redirect_to mission_tracks_path(@mission), :alert => "Não foi possível viajar para esta missão!"
    end
  end

  private

  def load_mission
    @mission = Mission.find(params[:mission_id])
  end

end
