class AddUserIdFieldToBspTrainings < ActiveRecord::Migration[5.2]
  def change
    add_column :bsp_trainings, :user_id, :integer
    add_column :medications, :user_id, :integer
    add_column :medication_counts, :user_id, :integer
    add_column :mars, :user_id, :integer
  end
end
