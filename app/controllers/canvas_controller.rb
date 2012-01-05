class CanvasController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :create

	def show
	  @oauth = Koala::Facebook::OAuth.new
	  redirect_to @oauth.canvas_url
	end

	def create
	  @user = User.authenticate(params[:signed_request])
    session[:user_id] = @user.id
    render :show
	end

	def new
	  #render javascript for Facebook authorization
	end

end

