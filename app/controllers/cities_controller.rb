class CitiesController < ApplicationController

  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
    @clues = @city.clues
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(params[:city])
    if @city.save
      redirect_to @city, :notice => 'City was created!'
    else
      render :new
    end
  end

end
