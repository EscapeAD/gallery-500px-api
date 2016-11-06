class ScoutsController < ApplicationController
  def index
    # client = FivePx.new(session[:oauth_token], session[:oauth_secret])
      client = F00px::Client.new

    response = client.get('photos')
    puts response.body
    render text: response.body
  end

  def create

  end


end
