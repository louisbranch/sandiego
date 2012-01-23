class TracksController < ApplicationController
  before_filter :load_resources

  def index
    @city = @mission.current_city
    @tracks = @mission.possible_tracks
    @track = @mission.current_track
  end

  def show
    @track = Track.find(params[:id])
    @networks = @track.networks
    update_progress_city
  end

  private

  def load_resources
    @mission = Mission.find(params[:mission_id])
    @progress = @mission.progress
    @headline = @mission.headline
  end

  def update_progress_city
    unless @progress.track == @track
      @time_traveled = @progress.city_travel(@track)
    end
  end

end
