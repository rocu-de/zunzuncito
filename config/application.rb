require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Zunzuncito
  class Application < Rails::Application
    config.load_defaults 6.1
    config.eager_load_paths << Rails.root.join('app/concepts')
  end
end
