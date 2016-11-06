class ScoutsController < ApplicationController
  def index
      client = F00px::Client.new
      response = client.get('photos?rpp=100')
      @photos  = JSON.parse(response.body)['photos']
  end

  def create

  end


end
