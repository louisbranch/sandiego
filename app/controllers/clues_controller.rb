class CluesController < ApplicationController
  before_filter :load_city

  def new
    @clue = @city.clues.build
  end

  def create
    @clue = @city.clues.build(params[:clue])
    if @clue.save
      redirect_to @city, :notice => 'Clue was created!'
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
      redirect_to @city, :notice => 'Clue was updated!'
    else
      render :new
    end
  end

  def destroy
    @clue = Clue.find(params[:id])
    if @clue.destroy
      redirect_to @city, :notice => 'Clue was deleted!'
    else
      redirect_to @city
    end
  end

  private

  def load_city
    @city = City.find(params[:city_id])
  end

end
