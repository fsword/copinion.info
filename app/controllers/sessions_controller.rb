require "openid"
require 'openid/extensions/sreg'
require 'openid/extensions/pape'
require 'openid/store/filesystem'

class SessionsController < ApplicationController

  def new
    begin
      identifier = params[:openid_identifier]
      if identifier.nil?
        flash[:error] = "Enter an OpenID identifier"
        redirect_to root_url
        return
      end
      oidreq = consumer.begin(identifier)
    rescue OpenID::OpenIDError => e
      flash[:error] = "找不到\"#{identifier}\"对应的openid服务"
      redirect_to root_url
      return
    end
    return_to = auth_url
    realm = root_url

    redirect_to oidreq.redirect_url(realm, return_to)
  end

  def destroy
    session[:user_id]=nil
    redirect_to root_url
  end

  def complete
    current_url = url_for(:action => 'complete', :only_path => false)
    parameters = params.reject{|k,v|
      request.path_parameters[k.to_sym]
    }
    oidresp = consumer.complete(parameters, current_url)
    case oidresp.status
    when OpenID::Consumer::FAILURE
      if oidresp.display_identifier
        flash[:error] = ("帐号#{oidresp.display_identifier}"\
                         "登录失败: #{oidresp.message}")
      else
        flash[:error] = "帐号登录失败 #{oidresp.message}"
      end
    when OpenID::Consumer::SUCCESS
      flash[:success] = "登录成功."
      user = User.auth_with_openid oidresp.identity_url,oidresp.display_identifier
      session[:user_id] = user.id
    when OpenID::Consumer::SETUP_NEEDED
      flash[:error] = "OpenID登录失败，帐号未设置"
    when OpenID::Consumer::CANCEL
      flash[:error] = "OpenID登录被取消"
    else
    end
    redirect_to root_url
  end

  private

  def consumer
    if @consumer.nil?
      dir = Pathname.new(RAILS_ROOT).join('db').join('cstore')
      store = OpenID::Store::Filesystem.new(dir)
      @consumer = OpenID::Consumer.new(session, store)
    end
    return @consumer
  end

#  protected
#  def open_id_authentication
#    authenticate_with_open_id do |result, identity_url|
#      if result.successful?
#        @current_user = User.auth_with_openid(identity_url)
#        successful_login
#      else
#        failed_login result.message
#      end
#    end
#  end
#
#  private
#  def successful_login
#    session[:user_id] = @current_user.id
#    redirect_to(root_url)
#  end
#
#  def failed_login(message)
#    flash[:error] = message
#    redirect_to(root_url)
#  end
end
