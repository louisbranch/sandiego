class TraitsController < ApplicationController

  def index
    @mission = Mission.find(params[:mission_id])
    @traits = @mission.suspect.traits.found
  end

end
