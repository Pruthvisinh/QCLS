class AddAddress1FirldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address_1, :string
    add_column :users, :address_2, :string
    add_column :users, :phone, :string
    add_column :users, :state, :string
    add_column :users, :company_id, :integer
  end
end
