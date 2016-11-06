class FivePx
  def initialize(token = nil, secret = nil)
    @client = F00px::Client.new

    if token && secret
      @client.token = token
      @client.token_secret = secret
    end
  end

  def most_popular(number = 100)
    @client.get('https://api.500px.com/v1/photos?feature=popular')
  end

private


end
