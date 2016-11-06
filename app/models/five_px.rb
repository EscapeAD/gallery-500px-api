class FivePx
  def initialize(token, secret)
      @client              = F00px::Client.new
      @client.token        = session[:token]
      @client.token_secret = session[:token_secret]
  end

 private

end
