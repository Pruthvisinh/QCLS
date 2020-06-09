class AddRoleFieldToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role, :string, default: "individual"
  end
end
