class CreateHpcServices < ActiveRecord::Migration[5.2]
  def change
    create_table :hpc_services do |t|
      t.integer :hpc_serviceable_id
      t.string :hpc_serviceable_type
      t.string :path_to_employment
      t.string :self_administered_medication
      t.string :staff_assistance
      t.string :provide_supervision
      t.string :assist_with_learning_work
      t.string :assist_coping_skills
      t.string :assist_developing_skills
      t.string :assist_maintaining_diet_control
      t.string :assistance_with_cooking_planing
      t.string :assistance_with_cooking_breakfast
      t.string :assistance_with_cooking_lunch
      t.string :assistance_with_cooking_dinner
      t.string :assistance_with_snack
      t.string :liesure_activities
      t.string :assist_with_household_chores
      t.string :assist_with_laundry
      t.string :assist_to_stay_on_task
      t.string :provide_assist_with_reminding_to_shower
      t.string :liesure_activities_which_he_loves
      t.string :encourage_to_work_for_his_own_money
      t.string :assist_with_learning_to_budget_money
      t.string :assist_with_shopping
      t.string :give_individual_for_friday
      t.string :assist_with_laccessing_the_community
      t.string :assist_with_household_maintenance
      t.string :night_on_site_on_call
      t.timestamps
    end
  end
end
