class Doc < ApplicationRecord
  has_attached_file :file
  validates_attachment_content_type :file, :content_type => ['application/pdf']

  belongs_to :user, required: false
  enum doc_type: [:isp, :bsp]
end
