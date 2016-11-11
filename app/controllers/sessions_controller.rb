class SessionsController < ApplicationController
  def create
    # minor bug with access
    session[:key]          = auth_hash['extra']['access_token'].consumer.key
    session[:secret]       = auth_hash['extra']['access_token'].consumer.secret
    session[:token]        = auth_hash['credentials']['token']
    session[:token_secret] = auth_hash['credentials']['secret']
    session[:username]     = auth_hash['info']['email']
    #request.env['omniauth.auth']
    redirect_to root_path
  end

  def destroy
    session[:token]        = nil
    session[:token_secret] = nil
    session[:username]     = nil
    session[:key]          = nil
    session[:secret]       = nil
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
