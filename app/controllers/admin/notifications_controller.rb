class Admin::NotificationsController < Admin::ApplicationController
  def index
    @visitor_notifications = Notification.where(notifiable_type: 'Visitor').order(id: :DESC)
    @comment_notifications = Notification.where(notifiable_type: 'Comment').order(id: :DESC)
    @message_notifications = Notification.where(notifiable_type: 'Message').order(id: :DESC)

  end

  def destroy
    @notifiable = Notification.find(params[:id])
    @notifiable.destroy
    redirect_to :back, notice: "Notification was successfully dissmissed"
  end
  def delete_all
    Notification.delete_all
    redirect_to :back, notice: " All notifications deleted successfully"
  end
end
