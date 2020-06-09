class AddGenderFieldToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gender, :string
    add_column :users, :individual_id, :string
    add_column :users, :title, :string
    add_column :users, :country, :string
    add_column :users, :zip, :string
    add_column :users, :telephone, :string
    add_column :users, :medicare_number, :string
    add_column :users, :tabs_id, :string
    add_column :users, :ethnicity, :string
    add_column :users, :medicaid_number, :string

  end
end
