class Medication < ApplicationRecord
  belongs_to :company
  belongs_to :user

  has_many :ist_informations, dependent: :destroy
  accepts_nested_attributes_for :ist_informations, allow_destroy: true, reject_if: :all_blank

  MEDICATION_TYPE = ['Oral', 'Inhaler', 'Optic (Rt eye /Lt eye)', 'Rectal', 'Subcutaneous', 'Sublingual', 'Nebulizer', 'Otic(Rt eye /Lt ear)', 'Vaginal', 'Insulin', 'Glucagon', 'EpiPen']

end
