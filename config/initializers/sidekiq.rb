Sidekiq.configure_server do |config|
  config.redis = { url: nil }
end

Sidekiq.configure_client do |config|
  config.redis = { url: nil }
end