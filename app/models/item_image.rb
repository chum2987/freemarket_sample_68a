class ItemImage < ApplicationRecord
  belongs_to :item
  validates :image_url, presence: true
end