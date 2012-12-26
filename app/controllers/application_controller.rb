class ApplicationController < ActionController::Base
  protect_from_forgery
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    unless current_user
      redirect_to login_url, :notice=>"Please Login"
    end
  end

  helper_method :current_user,:authorize
end
