class HomeController < ApplicationController
  def view
    @friends = Array.new
    if current_user
     graph = Koala::Facebook::API.new(session['fb_access_token'])
     @profile_image = graph.get_picture("me")
     @fbprofile = graph.get_object("me")
     @friends = graph.get_connections("me", "friends", api_version: 'v2.0')
    end
  end
end
