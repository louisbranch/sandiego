class CluesController < ApplicationController
  before_filter :load_city

  def new
    @clue = @city.clues.build
  end

  def create
    @clue = @city.clues.build(params[:clue])
    if @clue.save
      flash[:notice] = 'Clue was created!'
      redirect_to @city
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
      redirect_to @city
    else
      render :new
    end
  end

  def destroy
    @clue = Clue.find(params[:id])
    if @clue.destroy
      flash[:notice] = 'Clue was deleted!'
      redirect_to @city
    else
      redirect_to @city
    end
  end

  private

  def load_city
    @city = city.find(params[:city_id])
  end

end
