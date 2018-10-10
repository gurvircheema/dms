class CreateVendors < ActiveRecord::Migration[5.2]
  def change
    create_table :vendors do |t|
      t.string :internal_name,                  null: false
      t.string :legal_name,                     null: false
      t.string :remit_name,                     null: false
      t.string :account_number
      t.string :website
      t.string :federal_id_number
      t.string :preferred_currency
      t.integer :payment_terms,                 null: false, default: 30
      t.boolean :required_1099,                 null: false, default: false
      t.string :address
      t.string :city
      t.string :state_province
      t.string :country
      t.string :zip
      t.string :phone
      t.string :toll_free
      t.string :fax
      t.boolean :remit_same_as_primary_address, null: false, default: false
      t.string :remit_address
      t.string :remit_city
      t.string :remit_state_province
      t.string :remit_country
      t.string :remit_zip
      t.string :remit_phone
      t.string :remit_toll_free
      t.string :remit_fax
      t.integer :vendor_type,                   null: false, default: 0
      t.string :rating
      t.string :contract_on_file
      t.string :docker_number
      t.string :dot_number
      t.string :wcb_number
      t.string :ca_bond_number
      t.string :us_bond_number
      t.string :scac
      t.boolean :csa_approved,                  null: false, default: false
      t.boolean :hazmat,                        null: false, default: false
      t.date :hazmat_expiry_date
      t.string :smc3_tariff_code
      t.boolean :approved,                      null: false, default: false
      t.string :liability_insurance_provider
      t.string :liability_policy_number
      t.integer :liability_coverage,            null: false, default: 0
      t.date :liability_insurance_start_date
      t.date :liability_insurance_expiry_date
      t.string :cargo_insurnace_provider
      t.string :cargo_insurance_policy_number
      t.integer :cargo_insurance_coverage,      null: false, default: 0
      t.date :cargo_insurance_start_date
      t.date :cargo_insurance_expiry_date
      t.date :deleted_at

      t.timestamps
    end

    add_index :vendors, :internal_name, unique: true
  end
end
