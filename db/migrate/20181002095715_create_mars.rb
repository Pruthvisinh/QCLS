class CreateMars < ActiveRecord::Migration[5.2]
  def change
    create_table :mars do |t|
      t.string :allergies
      t.string :physician_name
      t.string :phone_number
      t.string :name
      t.string :record
      t.date :dob
      t.string :sex
      t.integer :company_id
      t.integer :created_by
      t.integer :edited_by
      t.timestamps
    end
  end
end
