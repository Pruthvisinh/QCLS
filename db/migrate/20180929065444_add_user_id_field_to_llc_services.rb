class AddUserIdFieldToLlcServices < ActiveRecord::Migration[5.2]
  def change
    add_column :llc_services, :user_id, :integer
    add_column :llc_services, :company_id, :integer
  end
end
