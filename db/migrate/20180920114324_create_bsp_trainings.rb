class CreateBspTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :bsp_trainings do |t|
      t.string :individual_name
      t.string :initial
      t.text :signature_of_dd
      t.text :signature_of_trainer
      t.date :date
      t.date :first_task_completed_date
      t.date :date_of_change_1
      t.date :date_of_change_2
      t.date :date_of_change_3

      t.timestamps
    end
  end
end
