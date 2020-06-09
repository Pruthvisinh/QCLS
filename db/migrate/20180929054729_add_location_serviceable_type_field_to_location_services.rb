class AddLocationServiceableTypeFieldToLocationServices < ActiveRecord::Migration[5.2]
  def change
    add_column :location_services, :location_serviceable_type, :string
    add_column :location_services, :location_serviceable_id, :integer
  end
end
