# 500-px omni strat
Rails.application.config.middleware.use OmniAuth::Builder do
    provider :fiveHundredPx, ENV["fivepx_key"], ENV["fivepx_secret"]
end
