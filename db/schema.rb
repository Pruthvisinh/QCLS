# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_05_111124) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "behavior_outcomes", force: :cascade do |t|
    t.date "date"
    t.string "time"
    t.integer "behavior_id"
    t.string "antecedents"
    t.string "behavior_text"
    t.string "outcome"
    t.string "initials"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "behaviors", force: :cascade do |t|
    t.string "provider"
    t.integer "user_id"
    t.integer "company_id"
    t.string "provider_no"
    t.string "service"
    t.string "medicaid_number"
    t.string "month"
    t.string "year"
    t.string "location"
    t.string "shift"
    t.string "has_pnr"
    t.boolean "transportation"
    t.string "pnr_description"
    t.text "additional_comments"
    t.integer "attended_day"
    t.integer "total_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bsp_trainings", force: :cascade do |t|
    t.string "individual_name"
    t.string "initial"
    t.text "signature_of_dd"
    t.text "signature_of_trainer"
    t.date "date"
    t.date "first_task_completed_date"
    t.date "date_of_change_1"
    t.date "date_of_change_2"
    t.date "date_of_change_3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
    t.integer "created_by"
    t.integer "edited_by"
    t.integer "user_id"
  end

  create_table "change_services", force: :cascade do |t|
    t.integer "change_serviceable_id"
    t.string "change_serviceable_type"
    t.string "description"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "company_type"
    t.string "name"
    t.string "phone"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "country"
  end

  create_table "docs", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "doc_type"
    t.string "file_file_name"
    t.string "file_content_type"
    t.bigint "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "hpc_services", force: :cascade do |t|
    t.integer "hpc_serviceable_id"
    t.string "hpc_serviceable_type"
    t.string "path_to_employment"
    t.string "self_administered_medication"
    t.string "staff_assistance"
    t.string "provide_supervision"
    t.string "assist_with_learning_work"
    t.string "assist_coping_skills"
    t.string "assist_developing_skills"
    t.string "assist_maintaining_diet_control"
    t.string "assistance_with_cooking_planing"
    t.string "assistance_with_cooking_breakfast"
    t.string "assistance_with_cooking_lunch"
    t.string "assistance_with_cooking_dinner"
    t.string "assistance_with_snack"
    t.string "liesure_activities"
    t.string "assist_with_household_chores"
    t.string "assist_with_laundry"
    t.string "assist_to_stay_on_task"
    t.string "provide_assist_with_reminding_to_shower"
    t.string "liesure_activities_which_he_loves"
    t.string "encourage_to_work_for_his_own_money"
    t.string "assist_with_learning_to_budget_money"
    t.string "assist_with_shopping"
    t.string "give_individual_for_friday"
    t.string "assist_with_laccessing_the_community"
    t.string "assist_with_household_maintenance"
    t.string "night_on_site_on_call"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ist_informations", force: :cascade do |t|
    t.integer "medication_id"
    t.date "date"
    t.string "time"
    t.text "signature_of_dd_person"
    t.text "signature_of_trainer"
    t.date "date_first_completed_by_person"
    t.date "date_of_change_1"
    t.date "date_of_change_2"
    t.date "date_of_change_3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "llc_services", force: :cascade do |t|
    t.string "individual_name"
    t.string "service_type"
    t.string "medicaid_number"
    t.string "provider_contract"
    t.string "location_of_services"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "company_id"
  end

  create_table "location_services", force: :cascade do |t|
    t.string "location"
    t.string "initials"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location_serviceable_type"
    t.integer "location_serviceable_id"
  end

  create_table "mars", force: :cascade do |t|
    t.string "allergies"
    t.string "physician_name"
    t.string "phone_number"
    t.string "name"
    t.string "record_text"
    t.date "dob"
    t.string "sex"
    t.integer "company_id"
    t.integer "created_by"
    t.integer "edited_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "medication_count_items", force: :cascade do |t|
    t.date "date"
    t.string "time"
    t.float "amount_on_hand"
    t.float "amount_used"
    t.float "amount_left"
    t.string "staff_initials"
    t.date "date_of_update"
    t.integer "medication_count_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medication_counts", force: :cascade do |t|
    t.string "individual_name"
    t.string "medication_order"
    t.date "date"
    t.string "time"
    t.float "amount_on_hand"
    t.float "amount_used"
    t.float "amount_left"
    t.string "staff_initials"
    t.date "date_of_update"
    t.date "discontinued_date"
    t.string "medication_disposal_location"
    t.string "medication_disposal_mgt_signature"
    t.string "certified_staff_signature_1"
    t.string "certified_staff_signature_2"
    t.string "certified_staff_signature_3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
    t.integer "created_by"
    t.integer "edited_by"
    t.integer "user_id"
  end

  create_table "medication_documents", force: :cascade do |t|
    t.string "documentation"
    t.date "date"
    t.string "time"
    t.string "initials"
    t.integer "mar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medication_items", force: :cascade do |t|
    t.string "medication_text"
    t.date "start_date"
    t.date "stop_date"
    t.integer "mar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medications", force: :cascade do |t|
    t.string "individual_name"
    t.string "identified_by"
    t.string "address"
    t.string "allergies"
    t.string "diagbosis"
    t.string "special_instruction"
    t.string "emergency_medications"
    t.string "behaviours_demonstrated_for_prn_meds"
    t.string "medication_routes"
    t.string "other"
    t.date "date"
    t.string "time"
    t.text "signature_of_dd_person"
    t.text "signature_of_trainer"
    t.date "date_first_completed_by_person"
    t.date "date_of_change_1"
    t.date "date_of_change_2"
    t.date "date_of_change_3"
    t.integer "company_id"
    t.integer "created_by"
    t.integer "edited_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "restricted_measures", force: :cascade do |t|
    t.string "attempts_to_reach_driver"
    t.string "attempt_to_contact_mom"
    t.string "physical_aggression"
    t.string "elopement"
    t.string "verbal_threats"
    t.string "chair_containment"
    t.string "time_hold_used"
    t.string "time_hold_used_1"
    t.string "two_person_containment"
    t.integer "behavior_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "seed_migration_data_migrations", id: :serial, force: :cascade do |t|
    t.string "version"
    t.integer "runtime"
    t.datetime "migrated_on"
  end

  create_table "service_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_types_users", force: :cascade do |t|
    t.integer "service_type_id"
    t.integer "user_id"
  end

  create_table "signature_lists", force: :cascade do |t|
    t.string "signatureable_type"
    t.integer "signatureable_id"
    t.text "signature"
    t.string "initials"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address_1"
    t.string "address_2"
    t.string "phone"
    t.string "state"
    t.integer "company_id"
    t.string "gender"
    t.string "individual_id"
    t.string "title"
    t.string "country"
    t.string "zip"
    t.string "telephone"
    t.string "medicare_number"
    t.string "tabs_id"
    t.string "ethnicity"
    t.string "medicaid_number"
    t.boolean "admin", default: false
    t.boolean "active", default: false
    t.string "role", default: "individual"
    t.integer "service_type_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

end
