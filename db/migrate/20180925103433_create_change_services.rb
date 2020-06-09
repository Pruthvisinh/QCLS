class CreateChangeServices < ActiveRecord::Migration[5.2]
  def change
    create_table :change_services do |t|
      t.integer :change_serviceable_id
      t.string :change_serviceable_type
      t.string :description
      t.date :date

      t.timestamps
    end
  end
end
