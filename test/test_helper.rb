require 'simplecov'

if ENV['CIRCLECI'].present?
  dir = File.join(ENV['CIRCLE_ARTIFACTS'], 'coverage')
  SimpleCov.coverage_dir(dir)
end

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter
]

SimpleCov.start do
  add_filter '/config/'
  add_filter '/db/'
  add_filter '/lib/'
  add_filter '/log/'
  add_filter '/test/'
  add_filter '/tmp/'
  add_filter '/vendor/'

  add_group 'Channels', 'app/channels'
  add_group 'Controllers', 'app/controllers'
  add_group 'Forms', 'app/forms'
  add_group 'Helpers', 'app/helpers'
  add_group 'Jobs', 'app/jobs'
  add_group 'Mailers', 'app/mailers'
  add_group 'Models', 'app/models'
end

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/spec'
require 'minitest/pride'

module ActiveSupport
  class TestCase
    fixtures :all
  end
end

def sample_file(filename = 'test_image.jpg')
  Rack::Test::UploadedFile.new(
    Rails.root.join("test/fixtures/files/#{filename}"), 'image/jpg'
  )
end
