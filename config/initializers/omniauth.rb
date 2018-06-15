Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['twitter_api_key'], ENV['twitter_api_secret']
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["google_client_id"], ENV["google_client_secret"]
end
