class ItemImage < ApplicationRecord
  mount_uploader :image_url, ImageUploader
  belongs_to :item, optional: true
  validates :image_url, presence: true
end