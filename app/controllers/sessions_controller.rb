class SessionsController < ApplicationController
  def create
    session[:uid]          = auth_hash.uid
    session[:user]         = auth_hash.info.nickname
    session[:oauth_token]  = auth_hash.credentials.token
    session[:oauth_secret] = auth_hash.credentials.secret
    redirect_to root_path

    # render json: request.env['omniauth.auth']
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
