class HeadlinesController < ApplicationController

  def index
    @headlines = Headline.all
  end

  def new
    @headline = Headline.new
  end

  def create
    @headline = Headline.new(params[:headline])
    if @headline.save
      redirect_to headlines_path, :notice => 'Headline was created!'
    else
      render :new
    end
  end

  def edit
    @headline = Headline.find(params[:id])
  end

  def update
    @headline = Headline.find(params[:id])
    if @headline.update_attributes(params[:headline])
      redirect_to headlines_path, :notice => 'Headline was updated!'
    else
      render :edit
    end
  end

  def destroy
    @headline = Headline.find(params[:id])
    if @headline.destroy
      redirect_to headlines_path, :notice => 'Headline was deleted!'
    end
  end

end
