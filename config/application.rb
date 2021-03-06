require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Posko
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    # Settings in config/environments/* take precedence over those
    # specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.api_only = true

    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore,
                          key: '_posko_web'

    Raven.configure do |config|
      config.dsn = ENV['SENTRY_DSN'].to_s
      config.environments = %w[staging production]
    end

    if ENV['POSKO_CORS_ORIGIN']
      config.middleware.insert_before 0, Rack::Cors do
        allow do
          origins (ENV.fetch('POSKO_CORS_ORIGIN') { '*' }).to_s
          resource (ENV.fetch('POSKO_CORS_RESOURCE') { '*' }).to_s,
                   headers: :any,
                   methods: [:get, :post, :patch, :delete, :options, :head],
                   credentials: true
        end
      end
    end
  end
end
