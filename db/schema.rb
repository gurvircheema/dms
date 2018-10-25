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

ActiveRecord::Schema.define(version: 2018_10_24_202806) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "city"
    t.string "state_province"
    t.string "country"
    t.string "zipcode"
    t.bigint "location_id"
    t.bigint "customer_id"
    t.bigint "vendor_id"
    t.bigint "driver_id"
    t.datetime "deleted_at"
    t.string "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_addresses_on_customer_id"
    t.index ["driver_id"], name: "index_addresses_on_driver_id"
    t.index ["location_id"], name: "index_addresses_on_location_id"
    t.index ["vendor_id"], name: "index_addresses_on_vendor_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "address_id"
    t.string "contact", null: false
    t.date "starting_date", null: false
    t.string "phone", null: false
    t.string "fax", null: false
    t.string "email", null: false
    t.string "website", null: false
    t.string "hst_num"
    t.decimal "hst_percentage", precision: 10, scale: 2
    t.string "pst_num"
    t.decimal "pst_percentage", precision: 10, scale: 2
    t.string "gst_num"
    t.decimal "gst_percentage", precision: 10, scale: 2
    t.string "factory_company"
    t.string "us_dot"
    t.string "mc_num"
    t.string "cvor_num"
    t.string "currency", null: false
    t.string "state", null: false
    t.string "scac_code"
    t.string "carrier_code"
    t.string "last_invoice", default: "1", null: false
    t.string "terms_for_customer_invoice"
    t.string "terms_conditions_for_carrier"
    t.string "notes_for_bol"
    t.string "notes_for_factor_invoice"
    t.string "notes_on_reminder_letter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_companies_on_address_id"
  end

  create_table "customer_locations", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_locations_on_customer_id"
    t.index ["location_id"], name: "index_customer_locations_on_location_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone"
    t.string "toll_free"
    t.string "fax"
    t.string "email", null: false
    t.datetime "deleted_at"
    t.string "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["name"], name: "index_customers_on_name", unique: true
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone", null: false
    t.string "cell"
    t.string "email", null: false
    t.date "date_of_birth"
    t.boolean "active", default: true, null: false
    t.integer "immigration_status", default: 0, null: false
    t.integer "driver_type", default: 0, null: false
    t.datetime "deleted_at"
    t.string "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "email"], name: "index_drivers_on_name_and_email", unique: true
  end

  create_table "drop_locations", force: :cascade do |t|
    t.datetime "appt_date", null: false
    t.string "ref_number"
    t.string "contact"
    t.integer "skids"
    t.integer "cases"
    t.integer "weight"
    t.boolean "ltl", default: false, null: false
    t.string "commodity"
    t.string "notes"
    t.datetime "deleted_at"
    t.string "deleted_by"
    t.bigint "location_id"
    t.bigint "load_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["load_id"], name: "index_drop_locations_on_load_id"
    t.index ["location_id"], name: "index_drop_locations_on_location_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.string "unit_number", null: false
    t.integer "unit_type", default: 0, null: false
    t.string "owned_by_company", null: false
    t.date "active_date", null: false
    t.date "inactive_date"
    t.string "license_plate"
    t.string "license_plate_state"
    t.string "vin", null: false
    t.string "certification_registration_number"
    t.date "certification_registration_expiry"
    t.string "safety_inspection_number"
    t.date "safety_inspection_expiry"
    t.string "insurance_provider"
    t.string "insurance_policy_number"
    t.date "insurance_policy_expiry"
    t.string "ifta_decal_number"
    t.date "ifta_decal_expiry"
    t.string "make", null: false
    t.string "model", null: false
    t.string "year", null: false
    t.integer "fuel_type", default: 0, null: false
    t.string "number_of_axles"
    t.integer "gross_weight_lbs"
    t.string "body_color"
    t.boolean "leased_vehicle", default: false, null: false
    t.string "lease_company"
    t.date "lease_end_date"
    t.integer "lease_monthly_rate"
    t.integer "lease_buyout_cost"
    t.bigint "driver_id"
    t.datetime "deleted_at"
    t.string "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_equipment_on_driver_id"
  end

  create_table "licenses", force: :cascade do |t|
    t.string "number", null: false
    t.date "issue_date", null: false
    t.date "expiry_date", null: false
    t.string "restrictions"
    t.string "province"
    t.bigint "driver_id"
    t.datetime "deleted_at"
    t.string "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_licenses_on_driver_id"
    t.index ["number"], name: "index_licenses_on_number", unique: true
  end

  create_table "loads", force: :cascade do |t|
    t.string "customer_ref_number"
    t.integer "customer_rate"
    t.string "currency", null: false
    t.string "customer_notes"
    t.string "equipment_type", null: false
    t.decimal "vendor_cost", precision: 10, scale: 2
    t.boolean "picked_up", default: false, null: false
    t.boolean "delivered", default: false, null: false
    t.boolean "invoiced", default: false, null: false
    t.boolean "payment_received", default: false, null: false
    t.boolean "paid_to_vendor", default: false, null: false
    t.datetime "deleted_at"
    t.string "deleted_by"
    t.bigint "customer_id"
    t.bigint "driver_id"
    t.bigint "vendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_loads_on_customer_id"
    t.index ["driver_id"], name: "index_loads_on_driver_id"
    t.index ["vendor_id"], name: "index_loads_on_vendor_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
    t.string "contact"
    t.string "email"
    t.string "phone"
    t.string "toll_free"
    t.string "fax"
    t.text "loading_info"
    t.text "receiving_info"
    t.text "additional_info"
    t.bigint "customer_id"
    t.datetime "deleted_at"
    t.string "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_locations_on_customer_id"
    t.index ["name"], name: "index_locations_on_name", unique: true
  end

  create_table "notes", force: :cascade do |t|
    t.string "notable_type"
    t.integer "notable_id"
    t.string "subject"
    t.text "description"
    t.bigint "user_id"
    t.datetime "deleted_at"
    t.string "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "permits", force: :cascade do |t|
    t.string "permit_type", null: false
    t.string "permit_number", null: false
    t.string "state_province", null: false
    t.date "expiry_date", null: false
    t.boolean "reminder", default: false, null: false
    t.datetime "deleted_at"
    t.bigint "equipment_id"
    t.string "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipment_id"], name: "index_permits_on_equipment_id"
  end

  create_table "pickup_locations", force: :cascade do |t|
    t.datetime "appt_date", null: false
    t.string "ref_number"
    t.string "contact"
    t.integer "skids"
    t.integer "cases"
    t.decimal "weight", precision: 10, scale: 2
    t.boolean "ltl", default: false, null: false
    t.string "commodity"
    t.string "notes"
    t.datetime "deleted_at"
    t.string "deleted_by"
    t.bigint "location_id"
    t.bigint "load_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["load_id"], name: "index_pickup_locations_on_load_id"
    t.index ["location_id"], name: "index_pickup_locations_on_location_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_roles_on_name", unique: true
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.boolean "admin", default: false, null: false
    t.datetime "deleted_at"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "vendors", force: :cascade do |t|
    t.string "internal_name", null: false
    t.string "legal_name", null: false
    t.string "remit_name", null: false
    t.string "email"
    t.string "account_number"
    t.string "website"
    t.string "federal_id_number"
    t.string "preferred_currency"
    t.integer "payment_terms", default: 30, null: false
    t.boolean "required_1099", default: false, null: false
    t.string "phone"
    t.string "toll_free"
    t.string "fax"
    t.boolean "remit_same_as_primary_address", default: false, null: false
    t.string "remit_phone"
    t.string "remit_toll_free"
    t.string "remit_fax"
    t.integer "vendor_type", default: 0, null: false
    t.string "rating"
    t.string "contract_on_file"
    t.string "docker_number"
    t.string "dot_number"
    t.string "wcb_number"
    t.string "ca_bond_number"
    t.string "us_bond_number"
    t.string "scac"
    t.boolean "csa_approved", default: false, null: false
    t.boolean "hazmat", default: false, null: false
    t.date "hazmat_expiry_date"
    t.string "smc3_tariff_code"
    t.boolean "approved", default: false, null: false
    t.string "liability_insurance_provider"
    t.string "liability_policy_number"
    t.integer "liability_coverage", default: 0, null: false
    t.date "liability_insurance_start_date"
    t.date "liability_insurance_expiry_date"
    t.string "cargo_insurance_provider"
    t.string "cargo_insurance_policy_number"
    t.integer "cargo_insurance_coverage", default: 0, null: false
    t.date "cargo_insurance_start_date"
    t.date "cargo_insurance_expiry_date"
    t.datetime "deleted_at"
    t.string "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["internal_name"], name: "index_vendors_on_internal_name", unique: true
  end

  create_table "violation_tickets", force: :cascade do |t|
    t.bigint "driver_id"
    t.string "motor_vehicle_act_section", null: false
    t.string "description", null: false
    t.integer "fine_amount", default: 0, null: false
    t.integer "points_deducted", default: 0, null: false
    t.date "issue_date"
    t.string "issue_place"
    t.datetime "deleted_at"
    t.string "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_violation_tickets_on_driver_id"
  end

  add_foreign_key "addresses", "customers"
  add_foreign_key "addresses", "drivers"
  add_foreign_key "addresses", "locations"
  add_foreign_key "addresses", "vendors"
  add_foreign_key "companies", "addresses"
  add_foreign_key "customer_locations", "customers"
  add_foreign_key "customer_locations", "locations"
  add_foreign_key "drop_locations", "loads"
  add_foreign_key "drop_locations", "locations"
  add_foreign_key "equipment", "drivers"
  add_foreign_key "licenses", "drivers"
  add_foreign_key "loads", "customers"
  add_foreign_key "loads", "drivers"
  add_foreign_key "loads", "vendors"
  add_foreign_key "locations", "customers"
  add_foreign_key "notes", "users"
  add_foreign_key "permits", "equipment"
  add_foreign_key "pickup_locations", "loads"
  add_foreign_key "pickup_locations", "locations"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
  add_foreign_key "violation_tickets", "drivers"
end
