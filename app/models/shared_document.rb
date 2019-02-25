class SharedDocument < ApplicationRecord
  belongs_to :sender    ,class_name: "User"
  belongs_to :receiver  ,class_name: "User"
  belongs_to :document

  scope :newest_first, lambda { order("created_at DESC") }
  scope :oldest_first, lambda { order("created_at ASC") }
  scope :search_sender, lambda {|query| where(["sender_id = ?", "%#{query}%"]) }
  scope :search_receiver, lambda {|query| where(["receiver_id = ?", "%#{query}%"]) }
  scope :search_document, lambda {|query| where(["document_id = ?", "%#{query}%"]) }
end
