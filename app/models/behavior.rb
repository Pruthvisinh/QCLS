class Behavior < ApplicationRecord
  belongs_to :user

  has_one :restricted_measure, dependent: :destroy
  accepts_nested_attributes_for :restricted_measure

  has_many :behavior_outcomes, dependent: :destroy
  accepts_nested_attributes_for :behavior_outcomes, allow_destroy: true, reject_if: :all_blank

  has_many :signature_lists, as: :signatureable, dependent: :destroy
  accepts_nested_attributes_for :signature_lists, allow_destroy: true, reject_if: :all_blank
end
