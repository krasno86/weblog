class Picture < ApplicationRecord

  max_paginates_per 5
  mount_uploader :avatar, AvatarUploader
  acts_as_votable
  # extend FriendlyId
  # friendly_id :name, use: :slugged

  belongs_to :category
  has_many :comments
  has_many :likes

end
