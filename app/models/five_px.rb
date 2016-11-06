class FivePx
  def initialize(token = nil, secret = nil)
      F00px::Client.new
      @client                = F00px::Client.new
      if !token.nil?
        @client.token        = session[:token]
        @client.token_secret = session[:token_secret]
      end
  end

 private

end
