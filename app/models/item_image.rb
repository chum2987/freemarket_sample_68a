# 修正後
class ItemImage < ApplicationRecord
  mount_uploader :image_url, ImageUploader
  belongs_to :item, optional: true
  validates :image_url, presence: true
end
# # # 修正前
# class ItemImage < ApplicationRecord
#   mount_uploader :image, ImageUploader
#   belongs_to :item
#   validates :image_url, presence: true
# end