class CreateIstInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :ist_informations do |t|
      t.integer :medication_id
      t.date :date
      t.string :time
      t.text :signature_of_dd_person
      t.text :signature_of_trainer
      t.date :date_first_completed_by_person
      t.date :date_of_change_1
      t.date :date_of_change_2
      t.date :date_of_change_3
      t.timestamps
    end
  end
end
