require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TCRegistry
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.action_dispatch.show_exceptions = false
    Raven.configure do |config|
      config.dsn = 'https://bc2314445c0e4b488b5e7b2fc04e7d09:31c782ab4b6645b294434826548fe519@sentry.io/149618'
      config.environments = ['staging', 'production']
    end
  end
end
