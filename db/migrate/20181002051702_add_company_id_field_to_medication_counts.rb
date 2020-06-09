class AddCompanyIdFieldToMedicationCounts < ActiveRecord::Migration[5.2]
  def change
    add_column :medication_counts, :company_id, :integer
    add_column :medication_counts, :created_by, :integer
    add_column :medication_counts, :edited_by, :integer
  end
end
