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
end
