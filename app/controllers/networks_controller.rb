class NetworksController < ApplicationController
  before_filter :load_mission

  def index
    @networks = @mission.current_track.networks
  end

  def show
    @network = Network.find(params[:id])
  end

  private

  def load_mission
    @mission = Mission.find(params[:mission_id])
  end

end
