class Address < ApplicationRecord
  belongs_to :user
  validates :postal_code, :prefecture_name, :city, :street, presence: true
end
