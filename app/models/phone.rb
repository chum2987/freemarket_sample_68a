class Phone < ApplicationRecord
  belongs_to :user, optional: true
  validates :phone_number, presence: true
end
