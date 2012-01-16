#encoding: UTF-8
class NetworksController < ApplicationController
  before_filter :load_mission

  layout 'mission'

  def index
    @networks = @mission.current_track.networks
    @track = @mission.current_track
  end

  def show
    @network = Network.find(params[:id])
    @track = @mission.current_track
    @progress.location_travel
    if @network.final?
      @mission.finish
      redirect_to mission_path(@mission), :notice => 'Você capturou o suspeito!'
    end
    if @network.trait? && !@network.informable.found?
      @network.informable.update_attributes(:found => true)
      flash.now[:notice] = 'Pista do suspeito encontrada!'
    end
  end

  private

  def load_mission
    @mission = Mission.find(params[:mission_id])
    @progress = @mission.progress
  end

end
