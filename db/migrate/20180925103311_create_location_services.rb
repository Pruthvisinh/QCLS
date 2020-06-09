class CreateLocationServices < ActiveRecord::Migration[5.2]
  def change
    create_table :location_services do |t|
      t.string :location
      t.string :initials
      t.date :date

      t.timestamps
    end
  end
end
