class AddServiceTypeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :service_type_id, :integer
  end
end
