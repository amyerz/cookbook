class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_username(params[:username])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to recipes_path
  	else
  		flash.now[:notice] = "Your email or password was not correct"
  		render :new
  	end
  end


  def destroy
  	session[:user_id] = nil
  	redirect_to recipes_path, :notice => "You are logged out"
  end
end
