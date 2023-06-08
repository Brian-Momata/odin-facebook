class NotificationsController < ApplicationController
  def check
    @notifications = current_user.notifications
  end
end
