if defined?(Sidekiq)
  Sidekiq.configure_server do |config|
    config.options = config.options.merge({queues: %w[default], concurrency: ENV.fetch("WORKER_MAX_THREADS") { 5 }})
    config.default_worker_options = config.default_worker_options.merge({retry: false})
  end
end

if defined?(Sidekiq)
  Sidekiq.configure_client do |config|
    config.default_worker_options = config.default_worker_options.merge({retry: false})
  end
end
