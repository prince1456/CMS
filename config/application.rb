require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
config.assets.precompile += Ckeditor.assets

module Blogadmin
  class Application < Rails::Application

    # Settings in config/environments/* take precedence over those specified here.
    config.assets.initialize_on_precompile = false
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
