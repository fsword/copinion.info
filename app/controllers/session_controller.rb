class SessionController < ApplicationController

  SITES={
    :google => '/openid_mock'#'http://www.google.com/profile'
  }

  def new
    p params[:by]
    redirect_to SITES[params[:by].to_sym]
  end
  
  def add
    session[:user_id]=User.auth_with_openid( params[:openid] ).id   # 需要验证
    redirect_to '/'
  end
  
  def destroy
    session[:user_id]=nil
    redirect_to '/'
  end
  
  def openid_mock_server
    redirect_to '/add?openid=li.jianye@gmail.com'
  end
end
