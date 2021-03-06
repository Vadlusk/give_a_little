require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GiveALittle
  class Application < Rails::Application
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    config.action_mailer.delivery_method = :smtp

    config.action_mailer.default_url_options = { host: 'givealittle.herokuapp.com' }

    config.action_mailer.smtp_settings = {
      address:              'smtp.sendgrid.net',
      port:                 '587',
      domain:               'givealittle.herokuapp.com',
      user_name:            ENV["sendgrid_username"],
      password:             ENV["sendgrid_password"],
      authentication:       'plain',
      enable_starttls_auto: true
    }
    # Don't generate system test files.
    config.generators.system_tests = nil
  end
end
