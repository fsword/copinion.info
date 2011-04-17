require "openid" 

class ApplicationController < ActionController::Base
  protect_from_forgery

  def required_user
    unless current_user
      redirect_to root_url
    end
  end

  def current_user
    @curent_user ||= User.find_by_id( session[:user_id] ) if session[:user_id]
  end
end
