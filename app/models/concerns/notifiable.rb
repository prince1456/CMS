module Notifiable
  extend ActiveSupport::Concern
  include do
    after_save :notify
  end
  def notify
    Notifications.build.save
  end

end
