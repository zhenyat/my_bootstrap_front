################################################################################
# require 'yaml'
# ZT_CONFIG = YAML.load(File.read(File.expand_path('../ZT_config.yml', __FILE__)))
# ZT_CONFIG = YAML.load_file("#{Rails.root}/config/zt_config.yml")
# puts ZT_CONFIG['zt_initializer']
#   or Sample 2:
# if File.exists?(File.expand_path('../application.yml', __FILE__))
#   config = YAML.load(File.read(File.expand_path('../application.yml', __FILE__)))
#   config.merge! config.fetch(Rails.env, {})
#   config.each do |key, value|
#     ENV[key] ||= value.to_s unless value.kind_of? Hash
#   end
# end
#     NB! add application.yml to .gitignore
################################################################################
require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MyBootstrapFront
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
     config.time_zone = 'Moscow'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    #ZT config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]

    config.i18n.available_locales = [:en, :es, :ru]
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]  #ZT: Multifile structure
    config.i18n.default_locale = :ru  #ZT

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
