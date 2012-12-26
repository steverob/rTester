class SessionsController < ApplicationController

  layout "login"
  def new
  end

  def create
      user = User.find_by_username(params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:notice]= "Logged in!"
        redirect_to administration_url
      else
        flash[:error]="Invalid username or password!"
        render "new"
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end  
