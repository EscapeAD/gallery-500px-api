class ScoutsController < ApplicationController
  def index
    # client = FivePx.new(session[:oauth_token], session[:oauth_secret])
    client = client = F00px::Client.new
      client.token        = session[:token]
      client.token_secret = session[:token_secret]

    response = client.get('photos')
    puts response.body
    client.get('photos')
  end

  def create

  end


end
