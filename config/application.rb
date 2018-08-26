require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Prepster
  class Application < Rails::Application
    config.api_only = true
    config.load_defaults 5.2
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post,:put, :delete, :options]
      end
    end
  end
end
