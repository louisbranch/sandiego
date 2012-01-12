class CluesController < ApplicationController
  before_filter :load_location

  def new
    @clue = @location.clues.build
  end

  def create
    @clue = @location.clues.build(params[:clue])
    if @clue.save
      flash[:notice] = 'Clue was created!'
      redirect_to @location
    else
      render :new
    end
  end

  def edit
    @clue = Clue.find(params[:id])
  end

  def update
    @clue = Clue.find(params[:id])
    if @clue.update_attributes(params[:clue])
      flash[:notice] = 'Clue was updated!'
      redirect_to @location
    else
      render :new
    end
  end

  def destroy
    @clue = Clue.find(params[:id])
    if @clue.destroy
      flash[:notice] = 'Clue was deleted!'
      redirect_to @location
    else
      redirect_to @location
    end
  end

  private

  def load_location
    @location = Location.find(params[:location_id])
  end

end

