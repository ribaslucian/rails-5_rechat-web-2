require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MyChat
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    
  
    config.action_cable.url = 'http://localhost:3000/cable'
    config.web_socket_server_url = 'ws://localhost:3000/cable'
    #  config.action_cable.allowed_request_origins = [
    #     # Local address of our RoR server
    #    'http://localhost:3000',
    #     # Local address we use for our React standalone client
    #    'http://localhost:8000',
    #  ]
  
    config.action_cable.allowed_request_origins = [/http:\/\/*/, /https:\/\/*/, /ws:\/\/*/, /wss:\/\/*/]
    config.action_cable.disable_request_forgery_protection = true
  end
end
