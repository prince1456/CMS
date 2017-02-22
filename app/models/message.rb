class Message < ApplicationRecord
  belongs_to :visitor
  def self.search_message(search)
    joins(:visitor).where("fullname ILIKE ? OR email ILIKE ? OR content ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
  def mark_read
    update(status: true) if status == false
  end

end
