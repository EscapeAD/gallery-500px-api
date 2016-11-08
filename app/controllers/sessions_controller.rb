class SessionsController < ApplicationController
  def create
    session[:token]        = auth_hash['credentials']['token']
    session[:token_secret] = auth_hash['credentials']['secret']
    session[:username]     = auth_hash['info']['email']
    # render json:  request.env['omniauth.auth']
    puts session[:token]
    puts session[:token_secret]
    puts session[:username]
    redirect_to root_path
  end

  def destroy
    session[:token]        = nil
    session[:token_secret] = nil
    session[:username]     = nil
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
