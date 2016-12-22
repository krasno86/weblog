class Oauth < ApplicationRecord
  belongs_to :user, inverse_of: :oauths
  validates :user, presence: true
  validates :uid, uniqueness: { scope: :provider }, presence: true
end
