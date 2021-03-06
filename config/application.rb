require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Paytravel
  class Application < Rails::Application

    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: false,
        request_specs: false
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end

    config.autoload_paths << "#{Rails.root}/app/reports"
    config.i18n.fallbacks = true
    config.time_zone = 'Kyiv'
    config.i18n.default_locale = :uk
    config.active_record.timestamped_migrations = false
    config.active_record.raise_in_transactional_callbacks = true
    config.exceptions_app = self.routes
    config.assets.paths << "#{Rails}/vendor/assets/fonts"
    config.autoload_paths << Rails.root.join('lib')
  end
end
