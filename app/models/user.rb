class User < ApplicationRecord

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :twitter, :vk]

  has_many :comments, dependent: :destroy
  has_many :oauths, dependent: :destroy, autosave: true, inverse_of: :user
  has_many :likes, dependent: :destroy

  acts_as_voter
  mount_uploader :avatar, AvatarUploader
  accepts_nested_attributes_for :oauths

  validates :email, uniqueness: true

  def self.find_user_by_oauth(uid: nil, provider: nil)
    return nil unless uid || provider
    Oauth.find_by(uid: uid, provider: provider)&.user
  end

end