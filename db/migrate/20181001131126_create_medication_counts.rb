class CreateMedicationCounts < ActiveRecord::Migration[5.2]
  def change
    create_table :medication_counts do |t|
      t.string :individual_name
      t.string :medication_order
      t.date :date
      t.string :time
      t.float :amount_on_hand
      t.float :amount_used
      t.float :amount_left
      t.string :staff_initials
      t.date :date_of_update
      t.date :discontinued_date
      t.string :medication_disposal_location
      t.string :medication_disposal_mgt_signature
      t.string :certified_staff_signature_1
      t.string :certified_staff_signature_2
      t.string :certified_staff_signature_3
      t.timestamps
    end
  end
end
