class User < ApplicationRecord
  include Gravtastic
  gravtastic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  has_many :posts
  has_many :likes
  has_many :comments
  has_many :notifications, foreign_key: "recipient_id"

  has_many :follows, class_name: "Follow", foreign_key: "follower_id"
  has_many :followed_users, -> { where("follows.status = ?", "Accepted") },
    through: :follows,
    source: :followed_user
  has_many :followers, class_name: "Follow", foreign_key: "followed_user_id"
  has_many :follower_users,-> { where("follows.status = ?", "Accepted") },
    through: :followers,
    source: :follower

  # finds or creates a user based on the OmniAuth authentication data
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end    
end
