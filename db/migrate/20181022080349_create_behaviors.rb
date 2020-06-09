class CreateBehaviors < ActiveRecord::Migration[5.2]
  def change
    create_table :behaviors do |t|
      t.string :provider
      t.integer :user_id
      t.integer :company_id
      t.string :provider_no
      t.string :service
      t.string :medicaid_number
      t.string :month
      t.string :year
      t.string :location
      t.string :shift
      t.string :has_pnr
      t.boolean :transportation
      t.string :pnr_description
      t.text :additional_comments
      t.integer :attended_day
      t.integer :total_day

      t.timestamps
    end
  end
end
