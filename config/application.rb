require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
Dotenv::Railtie.load
module SlovarisServer
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # config.action_mailer.default_url_options = { host: ENV["HOST"] }
    # config.action_mailer.delivery_method = :smtp
    # config.action_mailer.raise_delivery_errors = true # to raise error if smtp has error on setup
    # config.action_mailer.default :charset => "utf-8"
    # config.action_mailer.smtp_settings = {
    #   :address        => ENV["MAIL_DOMAIN"],
    #   :port           => ENV["MAIL_PORT"],
    #   :user_name      => ENV["MAIL_LOGIN"],
    #   :password       => ENV["MAIL_PASSWORD"],
    #   :authentication => 'plain',
    #   :tls            => true
    # }

  end
end
