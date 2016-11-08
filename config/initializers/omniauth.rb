# 500-px omni strat
Rails.application.config.middleware.use OmniAuth::Builder do
    provider :fiveHundredPx, ENV["fivepx_key"], ENV["fivepx_secret"]
end

F00px.configure do |config|
	  config.consumer_key = ENV['fivepx_key']
	  config.consumer_secret = ENV['fivepx_secret']
end
