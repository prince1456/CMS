class Message < ApplicationRecord
  belongs_to :visitor
  validates :content, presence: true
  has_many :notifications, as: :notifiable, dependent: :destroy
  def self.search_message(search)
    joins(:visitor).where("fullname ILIKE ? OR email ILIKE ? OR content ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
  def mark_read
    update(status: true) if status == false
  end

  after_save :notify
  def notify
    notifications.build.save
  end
  def self.messages
    Message.where(status: false).limit(3)
  end

end
