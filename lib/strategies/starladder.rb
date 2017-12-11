require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Starladder < OmniAuth::Strategies::OAuth2
      option :name, :starladder

      option :client_options, {
        site: 'http://auth.starladder.com/en/',
        authorize_url: 'https://auth.starladder.com/en/oauth/authorize',
        callback_url: 'http://127.0.0.1:3000/auth/starladder/callback'
      }

      uid { raw_info['id'] }

      info do
        {
          login: raw_info['nick'],
          email: raw_info['email'],
          avatar: raw_info['image_url']
        }
      end

      extra do
        { 'raw_info': raw_info }
      end

      def raw_info
        @raw_info ||= access_token
          .get('https://auth.starladder.com/en/api/v1/me.json').parsed
      end
    end
  end
end
