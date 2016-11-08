class ScoutsController < ApplicationController
  before_action :set_client
  def index
      response = @client.get('photos?rpp=100&feature=popular')
      @photos  = JSON.parse(response.body)['photos']
  end

  def show
    response = client.get('user/')
  end

  def create

  end

  def heart
    @photo   = params[:photo]
    puts @photo
    if @client.token == nil
      flash[:notice] = "Please Log in to do that"
      redirect_to root_path
    else
      flash[:notice] = "Please Log in to do that"
    @client.post("/v1/photos/#{@photo}/vote?vote=1")
    # redirect_to :back
    end
  end

private
  def set_client
    @client              = F00px::Client.new
    @client.token        = nil
    @client.token_secret = nil
    if session[:token_secret] && session[:token]
      @client.token        = session[:token]
      @client.token_secret = session[:token_secret]
    end
  end
end
