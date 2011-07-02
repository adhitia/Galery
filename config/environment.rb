# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.8' unless defined? RAILS_GEM_VERSION
require File.join(File.dirname(__FILE__), 'boot')
settings = YAML.load(File.open("#{RAILS_ROOT}/config/settings.yml"))
Rails::Initializer.run do |config|

  config.time_zone = 'UTC'
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.smtp_settings = {
    :address => settings[RAILS_ENV]['email']['address'],
    :port => settings[RAILS_ENV]['email']['port'],
    :domain => settings[RAILS_ENV]['email']['domain'],
    :authentication => settings[RAILS_ENV]['email']['authentication'].to_sym,
    :user_name => settings[RAILS_ENV]['email']['user_name'],
    :password => settings[RAILS_ENV]['email']['password'],
    :enable_starttls_auto => settings[RAILS_ENV]['email']['auto_tls']
  }

end
