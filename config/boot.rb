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
%w(application resources).each do |c|
  require_relative "../app/controllers/#{c}_controller"
end

%w(models controllers views).each do |folder|
  Dir.glob("app/#{folder}/*.rb").each { |path| require_relative "../#{path}" }
end
