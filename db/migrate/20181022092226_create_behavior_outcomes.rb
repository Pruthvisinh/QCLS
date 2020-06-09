class CreateBehaviorOutcomes < ActiveRecord::Migration[5.2]
  def change
    create_table :behavior_outcomes do |t|
      t.date :date
      t.string :time
      t.integer :behavior_id
      t.string :antecedents
      t.string :behavior_text
      t.string :outcome
      t.string :initials

      t.timestamps
    end
  end
end
