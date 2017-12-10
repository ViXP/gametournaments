require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Starladder < OmniAuth::Strategies::OAuth2
      option :name, :starladder

      option :client_options, {
        site: 'https://auth.starladder.com/en/oauth/authorize'
      }

      uid { raw_info['id'] }

      info do
        {
          login: raw_info['login'],
          email: raw_info['email']
        }
      end

      extra do
        {
          raw_info: raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/me').parsed
      end
    end
  end
end
