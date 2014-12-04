require 'database_cleaner'
require 'json'
require 'rack/test'
require_relative 'support/coverage'

ENV['RACK_ENV'] = 'test'

# Load application code
require File.expand_path '../../config/boot.rb', __FILE__

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

# Avoid log noise
ActiveRecord::Base.logger = nil unless ENV['LOG'] == true

module RSpecMixin
  include Rack::Test::Methods

  def app() EventTypesController end

  def json_response
    JSON.parse(last_response.body)
  end
end

RSpec.configure do |config|
  config.color = true
  config.formatter = 'documentation'
  config.include RSpecMixin
end
