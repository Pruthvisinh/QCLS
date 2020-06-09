class CreateMedications < ActiveRecord::Migration[5.2]
  def change
    create_table :medications do |t|

      t.string :individual_name
      t.string :identified_by
      t.string :address
      t.string :allergies
      t.string :diagbosis
      t.string :special_instruction
      t.string :emergency_medications
      t.string :behaviours_demonstrated_for_prn_meds
      t.string :medication_routes
      t.string :other
      t.date :date
      t.string :time
      t.string :signature_of_dd_person
      t.string :signature_of_trainer
      t.date :date_first_completed_by_person
      t.date :date_of_change_1
      t.date :date_of_change_2
      t.date :date_of_change_3
      t.integer :company_id
      t.integer :created_by
      t.integer :edited_by
      t.timestamps
    end
  end
end
