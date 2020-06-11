class Address < ApplicationRecord
  belongs_to :user

  validates :prefecture_name, :city, :street, presence: true

  validates :phone_number, numericality: true

  validates :postal_code, presence: true,format: {with: /\A\d{7}\z/ }

  validates :family_name, :first_name, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ }

  validates :family_name_kana, :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
end
