class RenameRecordFieldToMars < ActiveRecord::Migration[5.2]
  def change
    rename_column :mars, :record, :record_text
  end
end
