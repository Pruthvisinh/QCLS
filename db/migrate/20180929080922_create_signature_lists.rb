class CreateSignatureLists < ActiveRecord::Migration[5.2]
  def change
    create_table :signature_lists do |t|

      t.string :signatureable_type
      t.integer :signatureable_id
      t.text :signature
      t.string :initials

      t.timestamps
    end
  end
end
