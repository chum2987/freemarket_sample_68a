class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_one :credit_card
  has_one :phone, dependent: :destroy
  has_one :address, dependent: :destroy
  has_many :items, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birth_year
    validates :birth_month
    validates :birth_day
  end

  validates :email, presence: true, uniqueness: true, format: { with: /\A\S+@\S+\.\S+\z/ }

  validates :password, :password_confirmation, presence: true, length: { minimum: 7 }

  validates :family_name, :first_name, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ }

  validates :family_name_kana, :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
end
