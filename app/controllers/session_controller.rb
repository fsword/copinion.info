class SessionController < ApplicationController

  SITES={
    :google => '/openid_mock?site=google',#'http://www.google.com/profile'
    :sina => '/openid_mock?site=sina'
  }

  SITES_MEMBER={
    :google => 'li.jianye@gmail.com',#'http://www.google.com/profile'
    :sina => '淘李福'
  }

  def new
    redirect_to SITES[params[:by].to_sym]
  end
  
  def auth
    session[:user_id]=User.auth_with_openid( params[:openid] ).id   # 需要验证
    redirect_to url_for(:controller => :my)
  end
  
  def destroy
    session[:user_id]=nil
    redirect_to '/'
  end
  
  def openid_mock_server
    redirect_to url_for(:controller => :session, :action => :auth, :openid => SITES_MEMBER[params[:site].to_sym] )
  end
end
