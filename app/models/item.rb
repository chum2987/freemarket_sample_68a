class Item < ApplicationRecord
  belongs_to :user
  has_many :item_images
  belongs_to :category

  with_options presence: true do
    validates :name
    validates :price
    validates :description
    validates :category_id
    validates :condition
    validates :shipping_fee
    validates :shipping_method
    validates :shipping_date
  end

  enum condition: { 新品、未使用: 1, 未使用に近い: 2, 目立った傷や汚れなし: 3, やや傷や汚れあり: 4, 傷や汚れあり: 5, 全体的に状態が悪い: 6}, _prefix: true
end
