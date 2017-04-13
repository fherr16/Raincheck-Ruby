class NotificationsController < ApplicationController
  def viewNotifications
    @notifications = Notification.where(user_id: current_user.id)
    @unseen = Notification.where(user_id: current_user.id, status: true)
    @unseen.each do |e|
      e.status = false
    end
  end
end
