class NetworksController < ApplicationController
  before_filter :load_mission

  def index
    @networks = @mission.current_track.networks
  end

  def show
    @network = Network.find(params[:id])
    if @network.final?
      @mission.finish
      redirect_to mission_path(@mission)
    end
    if @network.trait? && !@network.informable.found?
      @network.informable.update_attributes(:found => true)
      flash.now[:notice] = 'Pista do suspeito encontrada!'
    end
  end

  private

  def load_mission
    @mission = Mission.find(params[:mission_id])
  end

end
