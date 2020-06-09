class CreateDocs < ActiveRecord::Migration[5.2]
  def change
    create_table :docs do |t|
      t.string :name
      t.text :description
      t.integer :doc_type
      t.attachment :file

      t.timestamps
    end
  end
end
