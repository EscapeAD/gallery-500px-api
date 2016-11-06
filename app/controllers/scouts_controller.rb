class ScoutsController < ApplicationController
  def index
    # client = FivePx.new(session[:oauth_token], session[:oauth_secret])
      client = F00px::Client.new
      response = client.get('photos?rpp=100')
      @photos  = JSON.parse(response.body)['photos']
  end

  def create

  end


end
