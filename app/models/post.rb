class Post < ApplicationRecord
  has_many :likes
  has_many :comments

  belongs_to :author, class_name: "User", foreign_key: "user_id"
  
  validates :body, presence: true
  
end
