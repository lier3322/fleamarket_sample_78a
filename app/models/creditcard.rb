class Creditcard < ApplicationRecord
  belongs_to :user

  validates :card_id, presence: true
  validates :user_id, presence: true
  validates :customer_id, presence: true
  # validates :exp_month, presence: true
  # validates :exp_year, presence: true
  # validates :cvc, presence: true
end
