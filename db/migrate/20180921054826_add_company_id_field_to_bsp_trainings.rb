class AddCompanyIdFieldToBspTrainings < ActiveRecord::Migration[5.2]
  def change
    add_column :bsp_trainings, :company_id, :integer
    add_column :bsp_trainings, :created_by, :integer
    add_column :bsp_trainings, :edited_by, :integer
  end
end
