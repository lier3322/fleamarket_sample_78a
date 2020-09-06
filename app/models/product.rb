class Product < ApplicationRecord
  belongs_to :product
  has_many :image
  belongs_to :user
end
