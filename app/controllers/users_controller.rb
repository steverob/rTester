class UsersController < ApplicationController

  def edit
    @user=User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
    if @user.save
      redirect_to administration_url, :notice => "Details Changed!"
    else
      render "edit"
      flash[:error]="Please check the fields!"
    end
  end

end
