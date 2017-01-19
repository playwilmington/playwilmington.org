require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PlayWilmington
  class Application < Rails::Application
    config.before_configuration do
      env_file = File.join(::Rails.root, 'config', 'local.yml')
      YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
      end if File.exists?(env_file)
    end

    config.exceptions_app = self.routes
  end
end
