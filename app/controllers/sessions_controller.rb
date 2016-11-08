class SessionsController < ApplicationController
  def create
    session[:token]        = auth_hash.token
    session[:token_secret] = auth_hash.secret
    render json:  request.env['omniauth.auth']
    # redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']['credentials']
  end
end
