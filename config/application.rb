require_relative 'boot'

require 'rails/all'
require './lib/story_updater'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EccoRails
  class Application < Rails::Application
    EasyTranslate.api_key = ENV['GOOGLE_TRANSLATE_API_KEY']
    Algolia.init(application_id: "LZ13R3NGNI", api_key: ENV['ALGOLIA_API_KEY'])
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
