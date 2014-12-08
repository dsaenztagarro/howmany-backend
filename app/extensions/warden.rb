module Sinatra
  module Warden
    module Helpers
      def warden
        env['warden']
      end

      def authenticate_user
        warden.authenticate!(:access_token)
      end
    end

    def self.registered(app)
      app.helpers Warden::Helpers

      # This is the route that unauthorized requests gets redirected to.
      app.post '/unauthenticated' do
        content_type :json
        status 401
        json({ message: "Error HTTP 401 Unauthorized" })
      end
    end
  end

  register Warden
end
