class FriendsController < ApplicationController
  def view
    @friends = Array.new
    if current_user
     graph = Koala::Facebook::API.new(session['fb_access_token'])
     @friends = graph.get_connections("me", "friends", api_version: 'v2.0')
    end
  end
  
  def list
    @id = params[:facebook_id]
    @user = User.find_by(uid: @id.to_i)
    @raincheck = Raincheck.find_by(user_id: @user.id, user_type: 1)
  end
  
  def invite
    @id = params[:user_id]
    @line_item_id = params[:line_item_id]
    @user = User.find(@id)
    @line_item = LineItem.find(@line_item_id)
    @time = Time.new
  end
  
  def youinvite
    @friends = Array.new
    if current_user
     graph = Koala::Facebook::API.new(session['fb_access_token'])
     @friends = graph.get_connections("me", "friends", api_version: 'v2.0')
    end
    @line_item = LineItem.find(params[:line_item_id])
    @restaurant = @line_item.restaurant.name
  end
end
