class Notification < ApplicationRecord
  belongs_to :notifiable, polymorphic: true
  def self.count_notification
    Notification.count
  end
  def self.count_comment
      where(notifiable_type: "Comment").count
  end
  def self.count_message
      where(notifiable_type: "Message").count
  end
  def self.count_visitor
      where(notifiable_type: "Visitor").count
  end
end
