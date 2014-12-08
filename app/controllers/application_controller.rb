class ApplicationController < Sinatra::Base
  register Sinatra::Warden
  register Sinatra::Oauth2::Strategies
  resource_server access_token_type: :bearer

  configure :development do
    register Sinatra::Reloader
  end

  set :views, Proc.new { File.join(root, '..', '..', 'app', 'views') }

  error ActiveRecord::RecordNotFound do
    @error = request.env['sinatra.error']
    rabl :'errors/500', :format => 'json'
  end

  use Warden::Manager do |config|
    config.scope_defaults :default,
      # Set your authorization strategy
      strategies: [:access_token],
      # Route to redirect to when warden.authenticate! returns a false answer.
      action: '/unauthenticated'
    config.failure_app = self
  end

  Warden::Manager.before_failure do |env,opts|
    env['REQUEST_METHOD'] = 'POST'
  end
end
