class CreateMedicationItems < ActiveRecord::Migration[5.2]
  def change
    create_table :medication_items do |t|
      t.string :medication_text
      t.date :start_date
      t.date :stop_date
      t.integer :mar_id
      t.timestamps
    end
  end
end
