require 'sinatra'
require 'sinatra/activerecord'
require_relative 'config/environment'

# Rabl config
require 'rabl'
require 'active_support/core_ext'
require 'active_support/inflector'
require 'builder'
Rabl.register!

%w(models views).each do |folder|
  Dir.glob("app/#{folder}/*.rb").each { |path| require_relative path }
end

set :views, Proc.new { File.join(root, 'app', 'views') }

get '/api/v1/event_types' do
  @event_types = EventType.all
  rabl :event_types, :format => "json"
end

# get '/api/events' do
#   Event.all
# end
#
# get '/api/events/:id' do
#   Event.find(params[:id].to_i)
# end
