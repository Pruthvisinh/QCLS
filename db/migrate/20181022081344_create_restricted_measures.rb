class CreateRestrictedMeasures < ActiveRecord::Migration[5.2]
  def change
    create_table :restricted_measures do |t|
      t.string :attempts_to_reach_driver
      t.string :attempt_to_contact_mom
      t.string :physical_aggression
      t.string :elopement
      t.string :verbal_threats
      t.string :chair_containment
      t.string :time_hold_used
      t.string :time_hold_used_1
      t.string :two_person_containment
      t.integer :behavior_id

      t.timestamps
    end
  end
end
