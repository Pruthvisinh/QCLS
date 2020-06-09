class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :company_type
      t.string :name
      t.string :phone
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps
    end
  end
end
