class Document < ApplicationRecord
  belongs_to :user
  has_many :shared_documents
  has_attached_file :pdf

  validates_attachment_presence :pdf
  validates_attachment :pdf, content_type: { content_type: "application/pdf" }

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :newest_first, lambda { order("created_at DESC") }
  scope :oldest_first, lambda { order("created_at ASC") }
  scope :search_name, lambda {|query| where(["document_name LIKE ?", "%#{query}%"]) }
  scope :search_user, lambda {|query| where(["user_id = ?", "%#{query}%"]) }
end
