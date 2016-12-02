class Picture < ApplicationRecord

  max_paginates_per 5

  belongs_to :category
  has_many :comments
  has_many :likes

  mount_uploader :avatar, AvatarUploader
  acts_as_votable
end
