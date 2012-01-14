#encoding: UTF-8
class ProgressController < ApplicationController

  def update
    @mission = Mission.find(params[:mission_id])
    @progress = @mission.progress
    if @progress.update_attributes(:track_id => params[:track_id])
      redirect_to @mission
    else
      redirect_to mission_cities_path(@mission), :alert => "Não foi possível viajar para esta missão!"
    end
  end

end
