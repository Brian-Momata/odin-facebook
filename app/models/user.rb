class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :likes
  has_many :comments

  has_many :follows, class_name: "follow", foreign_key: "follower_id"
  has_many :followed_users, through: :follows, source: :followed_user
  has_many :followers, class_name: "follow", foreign_key: "followed_user_id"
  has_many :follower_users, through: :followers, source: :follower
end
