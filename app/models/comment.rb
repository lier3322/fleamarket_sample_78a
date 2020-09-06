class Comment < ApplicationRecord
  belongs_to :user
  has_many :comment
  belongs_to :category
end
