class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :visitor
  has_many :notifications, as: :notifiable, dependent: :destroy
  def self.search_comments search
    joins(:visitor).where("fullname ILIKE ? OR message ILIKE ?", "%#{search}%", "%#{search}%")
  end
end
