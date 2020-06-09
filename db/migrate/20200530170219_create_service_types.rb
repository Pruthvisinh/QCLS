class CreateServiceTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :service_types do |t|
      t.string :name

      t.timestamps
    end

    ['Direct Care Staff', 'Transportation', 'Nursing', 'Manager', 'Other'].each do |service|
      ServiceType.create(name: service)
    end

    create_table :service_types_users do |t|
      t.integer :service_type_id
      t.integer :user_id
    end
  end
end
