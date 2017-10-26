require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module SampleRailsBlog
  class Application < Rails::Application
    config.load_defaults 5.1
    config.active_record.default_timezone = :local
    config.time_zone = 'Tokyo'
  end
end
