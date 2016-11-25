class Picture < ApplicationRecord
  belongs_to :category
  has_many :comment
  has_many :likes
end
