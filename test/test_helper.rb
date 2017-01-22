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
  add_filter '/app/forms/'

  add_group 'Controllers', 'app/controllers'
  add_group 'Helpers', 'app/helpers'
  add_group 'Models', 'app/models'
end

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/spec'
require 'minitest/pride'

class ActiveSupport
  class TestCase
    fixtures :all
    include Devise::Test::ControllerHelpers
  end
end
