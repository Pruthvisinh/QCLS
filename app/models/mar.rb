class Mar < ApplicationRecord
  belongs_to :company
  belongs_to :user
  has_many :medication_items, dependent: :destroy
  accepts_nested_attributes_for :medication_items, allow_destroy: true, reject_if: :all_blank

  has_many :medication_documents, dependent: :destroy
  accepts_nested_attributes_for :medication_documents, allow_destroy: true, reject_if: :all_blank

  has_many :signature_lists, as: :signatureable, dependent: :destroy
  accepts_nested_attributes_for :signature_lists, allow_destroy: true, reject_if: :all_blank
end
