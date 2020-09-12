class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :postnumber, :prefecture, :city, :house_number, presence: true

end
