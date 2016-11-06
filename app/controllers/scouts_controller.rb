class ScoutsController < ApplicationController
  def index
    # client = PhotoGetter.new
    @photos = client.get_photos
  end

  def create

  end

end
