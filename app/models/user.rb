class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_one :credit_card
  has_one :phone, dependent: :destroy
  has_one :address, dependent: :destroy
  has_many :items, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, presence: true
end
