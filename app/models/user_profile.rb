class UserProfile < ApplicationRecord
  belongs_to :user

  scope :search_user, lambda {|query| where(["user_id = ?", "%#{query}%"]) }
end
