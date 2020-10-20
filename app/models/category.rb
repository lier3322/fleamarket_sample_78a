class Category < ApplicationRecord
  has_ancestry
  has_many :product_categories
  has_many :products, through: :product_categories
end