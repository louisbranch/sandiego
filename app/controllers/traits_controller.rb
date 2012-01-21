class TraitsController < ApplicationController

  layout 'mission'

  def index
    @mission = Mission.find(params[:mission_id])
    @headline = @mission.headline
    @progress = @mission.progress
    @traits = @mission.suspect.traits.found
    @traits_found = @mission.traits_found
    @track = @mission.current_track
  end

end
