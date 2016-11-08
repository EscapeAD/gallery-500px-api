class SessionsController < ApplicationController
  def create
    session[:token]        = auth_hash['credentials']['token']
    session[:token_secret] = auth_hash['credentials']['secret']
    session[:username]     = request.env['omniauth.auth']['info']['username']
    render json:  request.env['omniauth.auth']
    # redirect_to root_path
  end

  def destroy
    session.each do |info|
      info = nil
    end
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
