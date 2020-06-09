class LlcService < ApplicationRecord
  has_one :hpc_service, as: :hpc_serviceable, dependent: :destroy
  accepts_nested_attributes_for :hpc_service

  has_many :location_services, as: :location_serviceable, dependent: :destroy
  accepts_nested_attributes_for :location_services, allow_destroy: true, reject_if: :all_blank

  has_many :change_services, as: :change_serviceable, dependent: :destroy
  accepts_nested_attributes_for :change_services, allow_destroy: true, reject_if: :all_blank

  has_many :signature_lists, as: :signatureable, dependent: :destroy
  accepts_nested_attributes_for :signature_lists, allow_destroy: true, reject_if: :all_blank

  belongs_to :company
  belongs_to :user
end
