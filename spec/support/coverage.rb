if ENV['TRAVIS']
  require 'codeclimate-test-reporter'
  require 'simplecov'
  require 'coveralls'
  Coveralls.wear!
  formatters = [SimpleCov::Formatter::HTMLFormatter]
  formatters << Coveralls::SimpleCov::Formatter # if ENV['COVERALLS_REPO_TOKEN']
  formatters << CodeClimate::TestReporter::Formatter if ENV['CODECLIMATE_REPO_TOKEN']
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[*formatters]
  SimpleCov.start do
    add_filter 'config'
  end
end
