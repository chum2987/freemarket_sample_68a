class Address < ApplicationRecord
  belongs_to :user

  validates :postal_code, :prefecture_name, :city, :street, presence: true

  validates :family_name, :first_name, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ }

  validates :family_name_kana, :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
end
