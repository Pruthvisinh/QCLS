class CreateMedicationCountItems < ActiveRecord::Migration[5.2]
  def change
    create_table :medication_count_items do |t|
      t.date :date
      t.string :time
      t.float :amount_on_hand
      t.float :amount_used
      t.float :amount_left
      t.string :staff_initials
      t.date :date_of_update
      t.integer :medication_count_id
      t.timestamps
    end
  end
end
