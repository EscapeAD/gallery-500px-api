class ScoutsController < ApplicationController
  def index
    client = FivePx.new(session[:oauth_token], session[:oauth_secret])
  end

  def create

  end


end
