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

ActiveRecord::Schema.define(version: 2018_10_07_204443) do

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

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "province"
    t.string "country"
    t.string "zip"
    t.string "phone"
    t.string "toll_free"
    t.string "fax"
    t.string "email"
    t.string "billing_address"
    t.string "billing_city"
    t.string "billing_province"
    t.string "billing_country"
    t.string "billing_zip"
    t.boolean "is_customer"
    t.boolean "is_carrier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "country", default: "Canada"
    t.string "zip"
    t.string "phone"
    t.string "cell"
    t.string "email"
    t.date "date_of_birth"
    t.boolean "active", default: true
    t.integer "ability_to_work", default: 0
    t.integer "driver_type", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

# Could not dump table "equipment" because of following StandardError
#   Unknown type 'unit_type' for column 'unit_type'

  create_table "licenses", force: :cascade do |t|
    t.string "number"
    t.date "issue_date"
    t.date "expiry_date"
    t.string "restrictions"
    t.string "province"
    t.bigint "driver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_licenses_on_driver_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "province"
    t.string "country"
    t.string "zip"
    t.string "contact"
    t.string "email"
    t.string "phone"
    t.string "toll_free"
    t.string "fax"
    t.text "loading_info"
    t.text "receiving_info"
    t.text "additional_info"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_locations_on_company_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "notable_type"
    t.integer "notable_id"
    t.string "subject"
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "permits", force: :cascade do |t|
    t.string "permit_type"
    t.string "permit_number"
    t.string "state_province"
    t.date "expiry_date"
    t.boolean "reminder", default: false, null: false
    t.datetime "deleted_at"
    t.bigint "equipment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipment_id"], name: "index_permits_on_equipment_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.boolean "is_admin", default: false, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vendors", force: :cascade do |t|
    t.string "internal_name"
    t.string "legal_name"
    t.string "remit_name"
    t.string "account_number"
    t.string "website"
    t.string "federal_id_number"
    t.string "preferred_currency"
    t.integer "payment_terms", default: 30, null: false
    t.boolean "required_1099", default: false, null: false
    t.string "address"
    t.string "city"
    t.string "state_province"
    t.string "country"
    t.string "zip"
    t.string "phone"
    t.string "toll_free"
    t.string "fax"
    t.boolean "remit_same_as_primary_address", default: false, null: false
    t.string "remit_address"
    t.string "remit_city"
    t.string "remit_state_province"
    t.string "remit_country"
    t.string "remit_zip"
    t.string "remit_phone"
    t.string "remit_toll_free"
    t.string "remit_fax"
    t.string "vendor_type"
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
    t.string "cargo_insurnace_provider"
    t.string "cargo_insurance_policy_number"
    t.integer "cargo_insurance_coverage", default: 0, null: false
    t.date "cargo_insurance_start_date"
    t.date "cargo_insurance_expiry_date"
    t.date "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "violation_tickets", force: :cascade do |t|
    t.bigint "driver_id"
    t.string "motor_vehicle_act_section"
    t.string "description"
    t.integer "fine_amount"
    t.integer "points_deducted"
    t.date "issue_date"
    t.string "issue_place"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_violation_tickets_on_driver_id"
  end

  add_foreign_key "equipment", "drivers"
  add_foreign_key "licenses", "drivers"
  add_foreign_key "locations", "companies"
  add_foreign_key "notes", "users"
  add_foreign_key "permits", "equipment"
  add_foreign_key "violation_tickets", "drivers"
end
