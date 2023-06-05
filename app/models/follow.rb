class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User", foreign_key: "follower_id"
  belongs_to :followed_user, class_name: "User", foreign_key: "followed_user_id"
  has_one :notification, dependent: :destroy
end
