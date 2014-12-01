require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'pry'

# Rabl config
require 'rabl'
require 'active_support/core_ext'
require 'active_support/inflector'
require 'builder'
Rabl.register!

%w(models views).each do |folder|
  Dir.glob("app/#{folder}/*.rb").each { |path| require_relative path }
end

class HowManyApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  set :views, Proc.new { File.join(root, 'app', 'views') }

  get '/api/v1/event_types' do
    @event_types = EventType.all
    rabl :event_types, :format => "json"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
