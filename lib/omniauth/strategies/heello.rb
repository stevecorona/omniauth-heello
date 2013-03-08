require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Heello < OmniAuth::Strategies::OAuth2

      option :name, 'heello'
      option :client_options, {
        site:          "https://api.heello.com",
        authorize_url: "/oauth/authorize",
        proxy:         ENV['http_proxy'] ? URI(ENV['http_proxy']) : nil
      }

      uid { raw_info["id"] }

      info do
        {
          nickname: raw_info["username"],
          name:     raw_info["name"],
          website:  raw_info["website"],

          images: {
            avatar:     raw_info["avatar"],
            background: raw_info["background"],
            cover:      raw_info["cover"]
          },
          urls: {
            website: raw_info["website"],
            heello: "http://heello.com/" + raw_info["username"]
          }
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get("/api/me.json").parsed["response"]
      end

    end
  end
end