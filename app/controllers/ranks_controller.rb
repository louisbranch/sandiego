class RanksController < ApplicationController

  def index
    @ranks = Rank.all
    @users = User.includes(:rank, :missions)
  end

end
