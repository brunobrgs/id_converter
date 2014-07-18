require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env)

module IdConverter
  class Application < Rails::Application
    # Custom directories with classes and modules you want to be autoloadable.
    config.autoload_paths += %W(
      #{config.root}/lib
      #{config.root}/app/business
    )

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Brasilia'
    config.active_record.default_timezone = :local
    config.active_record.time_zone_aware_attributes = false

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir["#{config.root}/config/locales/**/*.yml"]
    config.i18n.default_locale = 'pt-BR'

    I18n.enforce_available_locales = true

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable escaping HTML in JSON.
    config.active_support.escape_html_entities_in_json = true

    # Include helpers from current controller only
    config.action_controller.include_all_helpers = false

    config.active_record.disable_implicit_join_references = false

    # Version of your assets, ch
    # ange this if you want to expire all your assets
    config.assets.version = '1.0'
  end
end
