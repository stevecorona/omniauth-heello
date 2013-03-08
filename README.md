# Omniauth strategy for Heello

Working, very easy to use OmniAuth strategy for [Heello](https://heello.com)-- Uses OAuth2.

## Install the `omniauth-heello` gem

If you're using Bundler, edit your Gemfile and run `bundle install`

    gem "omniauth-heello"

Or else, just run `gem install omniauth-heello`.

## Create a new Heello Application
Go to the [Developer Portal](https://developer.heello.com/) and create an application- get a `key` and `secret`.

## Add an OmniAuth Heello initializer

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :heello, ENV["heello_key"], ENV["heello_secret"]
    end

## Add a Callback Route

In your `routes.rb` file, add a callback controller

    match '/auth/heello/callback', to: 'sessions#create'

And then you'd had a `SessionsController` with the following code:

    class SessionsController < ApplicationController
      def create
        debug request.env['omniauth.auth']
      end
    end

If you to go `/auth/heello`, it'll log you in with Heello, and you'll see something like this:

    --- !map:OmniAuth::AuthHash 
    provider: heello
    uid: 5
    info: !map:OmniAuth::AuthHash::InfoHash 
      nickname: s
      name: Steve Corona
      website: ""
      images: !map:Hashie::Mash 
        avatar: //d2trw7474qpa0b.cloudfront.net/s/thumb.jpg?9e4ff7ed2f2e86f940befcbce4cfa859
        background: //d2dh8keolssd5w.cloudfront.net/default.png
        cover: //d38xdbig8ajh16.cloudfront.net/default.png
      urls: !map:Hashie::Mash 
        website: ""
        heello: http://heello.com/s
    credentials: !map:Hashie::Mash 
      token: ae3f910cc72140a8ef2ba32ded2d4d46e7347a25a22fb41bf6825a276f01bbdc
      refresh_token: 91896df567476ef1fc0a12f2e3fb0d90cf8e439d578cafe3ee8a7b4f42f499aa
      expires_at: 1394344295
      expires: true
    extra: !map:Hashie::Mash 
      raw_info: !map:Hashie::Mash 
        id: 5
        username: s
        name: Steve Corona
        bio: CTO at Twitpic. I wrote a book on Scaling PHP, http://scalingphpbook.com.
        website: ""
        location: Charleston, SC
        timezone: Eastern Time (US & Canada)
        created_at: 
        avatar: //d2trw7474qpa0b.cloudfront.net/s/thumb.jpg?9e4ff7ed2f2e86f940befcbce4cfa859
        background: //d2dh8keolssd5w.cloudfront.net/default.png
        cover: //d38xdbig8ajh16.cloudfront.net/default.png
        metadata: !map:Hashie::Mash 
          ping_count: 175
          checkin_count: 3
          listener_count: 4516
          listening_count: 113