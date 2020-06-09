class MedicationCount < ApplicationRecord
  belongs_to :company
  belongs_to :user
  has_many :medication_count_items, dependent: :destroy
  accepts_nested_attributes_for :medication_count_items, allow_destroy: true, reject_if: :all_blank

  has_many :signature_lists, as: :signatureable, dependent: :destroy
  accepts_nested_attributes_for :signature_lists, allow_destroy: true, reject_if: :all_blank
end
