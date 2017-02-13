class Tag < ApplicationRecord
  has_many  :post_tags, through: :post_tags
end
