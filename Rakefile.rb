require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'sinatra/activerecord/rake'

require_relative 'config/boot'
Dir.glob("lib/tasks/*.rake").each { |path| load path }

RuboCop::RakeTask.new do |task|
  task.requires << 'rubocop-rspec'
end

RSpec::Core::RakeTask.new :specs do |task|
  task.pattern = Dir['spec/**/*_spec.rb']
end

task :default => ['specs']