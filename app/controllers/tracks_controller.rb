#encoding: UTF-8
class TracksController < ApplicationController
  before_filter :load_mission

  layout 'mission'

  def index
    @city = @mission.current_city
    @tracks = @mission.possible_tracks
    @track = @mission.current_track
  end

  def show
    @track = Track.find(params[:id])
    unless @progress.track == @track
      @progress.update_attributes(:track => @track)
      @progress.city_travel
    end
    render :show
  end

  private

  def load_mission
    @mission = Mission.find(params[:mission_id])
    @progress = @mission.progress
  end

end
