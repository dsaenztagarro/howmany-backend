module Sinatra
  module Oauth2
    module Strategies
      module Helpers
      end

      def resource_server(opts = {})
        define_method :authenticate_user do
          warden.authenticate!(opts[:access_token_type])
        end
      end

      Warden::Strategies.add(:bearer) do
        def valid?
          access_token.is_a? String
        end

        def authenticate!
          access_granted = (access_token == 'my_access_token')
          !access_granted ? fail!("Could not log in") : success!(access_granted)
        end

        def access_token
          @access_token ||= authorization_keys.map do |key|
            request.env[key]
          end.compact.first
        end

        def authorization_keys
          Rack::Auth::AbstractRequest::AUTHORIZATION_KEYS
        end
      end

      def self.registered(app)
        app.helpers Strategies::Helpers
      end
    end
  end

  register Oauth2::Strategies
end
