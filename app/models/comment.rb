class Comment < ApplicationRecord
  belongs_to :picture, dependent: :destroy
  belongs_to :user
end
