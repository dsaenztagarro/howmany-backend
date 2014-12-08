require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/json'
require 'sinatra/reloader'
require 'pry'
require 'warden'

# Rabl config
require 'rabl'
require 'active_support/core_ext'
require 'active_support/inflector'
require 'builder'
Rabl.register!

Dir.glob("app/extensions/*.rb").each { |path| require_relative "../#{path}" }

require_relative '../app/controllers/application_controller'

%w(models controllers views).each do |folder|
  Dir.glob("app/#{folder}/*.rb").each { |path| require_relative "../#{path}" }
end
