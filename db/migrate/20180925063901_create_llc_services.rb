class CreateLlcServices < ActiveRecord::Migration[5.2]
  def change
    create_table :llc_services do |t|
      t.string :individual_name
      t.string :service_type
      t.string :medicaid_number
      t.string :provider_contract
      t.string :location_of_services
      t.date :date
      t.timestamps
    end
  end
end
