class Post < ApplicationRecord
    has_many :comments
    has_many :tags, through: :post_tags
    has_many :post_tags, dependent: :destroy
    belongs_to :moderator
    validates :title, presence: true
    validates :content, presence: true



    def self.matching_title_or_content search
      where("title ILIKE ? OR content ILIKE ?", "%#{search}%", "%#{search}%")
    end

    def self.filter_by_tags param_tag
      includes(:tags).where(publish: true, tags: {name: param_tag}).order(id: :DESC)
    end
end
