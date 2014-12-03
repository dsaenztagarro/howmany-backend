class ApplicationController < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  set :views, Proc.new { File.join(root, '..', '..', 'app', 'views') }

  error ActiveRecord::RecordNotFound do
    @error = request.env['sinatra.error']
    rabl :'errors/500', :format => 'json'
  end
end
