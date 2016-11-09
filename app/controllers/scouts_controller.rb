class ScoutsController < ApplicationController
  before_action :set_client
  def index
      response = @client.get('photos?rpp=100&feature=popular')
      @photos  = JSON.parse(response.body)['photos']
  end

  def show
    @username = params[:search]
    response = @client.get("users/show?username=#{@username}")
    @user  = JSON.parse(response.body)
    if @user['status'] == 403
      render :error
    else
    render json: @user
    end
  end

  def create

  end

  def heart
    @photo   = params[:photo]
    if @client.token == nil
      flash[:notice] = "Please Log in to do that"
      redirect_to root_path
    else
      flash[:notice] = "you like a photo"
      @client.post("photos/#{@photo}/vote?vote=1")
      redirect_to root_path
    end
  end

  def unheart
    @photo   = params[:photo]
    if @client.token == nil
      flash[:notice] = "Please Log in to do that"
    else
      #delete method broken
      @client.request('delete', "photos/#{@photo}/vote")
      flash[:notice] = "you unlike a photo"
      redirect_to root_path
    end
  end

private
  def set_client
    @client              = F00px::Client.new
    @client.token        = nil
    @client.token_secret = nil
    if session[:token_secret] && session[:token]
      @client.token           = session[:token]
      @client.token_secret    = session[:token_secret]
      # @client.consumer_key    = session[:key]
      # @client.consumer_secret = session[:secret]
    end
  end
end
