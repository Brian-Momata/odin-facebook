class Notification < ApplicationRecord
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"
  belongs_to :follow

  scope :pending_requests, -> { 
    joins(:follow).where(follows: { status: "pending" }) }
end
