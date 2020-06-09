class ChangeSignatureOffDdPersonFieldToBeTextMedications < ActiveRecord::Migration[5.2]
  def change
    change_column :medications, :signature_of_dd_person, :text
    change_column :medications, :signature_of_trainer, :text
  end
end
