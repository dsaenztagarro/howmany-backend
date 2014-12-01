require 'database_cleaner'
require 'factory_girl'
require 'rack/test'
require 'json'

ENV['RACK_ENV'] = 'test'

# Coverage report
require 'codeclimate-test-reporter'
require 'simplecov'
require 'coveralls'
formatters = [SimpleCov::Formatter::HTMLFormatter]
formatters << Coveralls::SimpleCov::Formatter if ENV['COVERALLS_REPO_TOKEN']
formatters << CodeClimate::TestReporter::Formatter if ENV['CODECLIMATE_REPO_TOKEN']
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[*formatters]
SimpleCov.start do
  add_filter 'config'
end

# Load factories
FactoryGirl.definition_file_paths = %w{./factories}
FactoryGirl.find_definitions

# Load application code
require File.expand_path '../../app.rb', __FILE__

# Avoid log noise
ActiveRecord::Base.logger = nil unless ENV['LOG'] == true

module RSpecMixin
  include Rack::Test::Methods
  include FactoryGirl::Syntax::Methods

  def app() Sinatra::Application end

  def json_response
    JSON.parse(last_response.body)
  end
end

RSpec.configure do |config|
  config.color = true
  config.formatter = 'documentation'
  config.include RSpecMixin

  config.before(:suite) do
    FactoryGirl.lint
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
