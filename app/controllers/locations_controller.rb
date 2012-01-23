class LocationsController < ApplicationController
  load_and_authorize_resource

  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(params[:location])
    if @location.save
      redirect_to @location, :notice => 'Location was created!'
    else
      render :new
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(params[:location])
      redirect_to @location, :notice => 'Location was updated!'
    else
      render :edit
    end
  end

  def destroy
    @location = Location.find(params[:id])
    if @location.destroy
      redirect_to locations_path, :notice => 'Location was deleted!'
    else
      redirect_to locations_path
    end
  end

end
