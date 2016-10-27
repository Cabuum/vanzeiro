require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Vanzeiro
  class Application < Rails::Application
    config.assets.enabled = true
    config.assets.compile = true
    config.exceptions_app = routes
    config.autoload_paths << Rails.root.join('lib')
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts', 'videos')

    Dir.glob(Rails.root.join('config/locales/**/*/')).each do |dir|
      paths['config/locales'] << dir
    end

    config.active_record.raise_in_transactional_callbacks = true

    config.generators do |g|
      g.hidden_namespaces << :test_unit << :erb << :mongoid << :less << :sass <<
        :scss << :js << :coffee << :active_record

      g.view_specs      false
      g.helper_specs    false
      g.assets          false
      g.helper          false
    end

    config.time_zone = 'Brasilia'
    config.i18n.default_locale = :pt
  end
end
