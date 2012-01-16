class TraitsController < ApplicationController

  layout 'mission'

  def index
    @mission = Mission.find(params[:mission_id])
    @progress = @mission.progress
    @traits = @mission.suspect.traits.found
    @track = @mission.current_track
  end

end
