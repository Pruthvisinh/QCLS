class CreateMedicationDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :medication_documents do |t|
      t.string :documentation
      t.date :date
      t.string :time
      t.string :initials
      t.integer :mar_id
      t.timestamps
    end
  end
end
