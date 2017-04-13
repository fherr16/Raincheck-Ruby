class InvitationsController < ApplicationController
  def view
    @pending = Invite.where(recipient_id: current_user.id, response: 0)        
    @invited = Invite.where(recipient_id: current_user.id, response: 1)
    @invites = Invite.where(sender_id: current_user.id, response: 1)
    @waiting = Invite.where(sender_id:current_user.id, response: 0)
  end
  
  def accept
    invitation = Invite.find(params[:invite])
    invitation.update_attribute(:response, 1)
    restaurant = LineItem.find(invitation.line_item_id).restaurant.name
    accept = "#{current_user.name} has accepted your request to eat at #{restaurant}"
    notification = Notification.new(user_id: invitation.sender_id, content: accept, status:true)
    notification.save
    flash[:success] = "You have accepted the request #{invitation.id}"
    redirect_to invites_path
  end
  
  def reject
    invitation = Invite.find_by(params[:invite])
    restaurant = LineItem.find(invitation.line_item_id).restaurant.name
    reject = "#{current_user.name} has rejected your request to eat at #{restaurant}"
    notification = Notification.new(user_id: invitation.sender_id, content: reject, status:true)
    notification.save
    invitation.delete
    flash[:success] = "You have rejected the request"
    redirect_to invites_path
  end

  def create
    line_item_id = params[:line_item_id]
    user_id = params[:recipient_id]
    month = cookies[:month]
    day = cookies[:day]
    year = cookies[:year]
    hour = cookies[:hour]
    minute = cookies[:minute]
    period = cookies[:period]
    date = month + " " + day + " " + year
    time = hour + ":" + minute + " " + period
    @invitation = Invite.find_by(sender_id: current_user.id, recipient_id: user_id, line_item_id: line_item_id)
    if @invitation == nil
      @invitation = Invite.new(sender_id: current_user.id, recipient_id: user_id, line_item_id: line_item_id, response: 0, date: date, time: time)
      respond_to do |format|
        if @invitation.save
          format.html { redirect_to friends_path, notice: 'Sent Invite'} 
          format.json { render :show, status: :created, location: @line_item }
        else
          format.html { render :new }
          format.json { render json: @line_item.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:danger] = "You already sent an invite"
      redirect_to friends_path
    end
  end
  
  def destroy
  end
end
