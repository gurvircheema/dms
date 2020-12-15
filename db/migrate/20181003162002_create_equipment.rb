class CreateEquipment < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment do |t|
      t.string :unit_number,      null: false
      t.integer :unit_type,       null: false, default: 0
      t.string :owned_by_company, null: false
      t.date :active_date,        null: false
      t.date :inactive_date
      t.string :license_plate
      t.string :license_plate_state
      t.string :vin, null: false
      t.string :certification_registration_number
      t.date :certification_registration_expiry
      t.string :safety_inspection_number
      t.date :safety_inspection_expiry
      t.string :insurance_provider
      t.string :insurance_policy_number
      t.date :insurance_policy_expiry
      t.string :ifta_decal_number
      t.date :ifta_decal_expiry
      t.string :make,             null: false
      t.string :model,            null: false
      t.string :year,             null: false
      t.integer :fuel_type,       null: false, default: 0
      t.string :number_of_axles
      t.integer :gross_weight_lbs
      t.string :body_color
      t.boolean :leased_vehicle, null: false, default: false
      t.string :lease_company
      t.date :lease_end_date
      t.integer :lease_monthly_rate
      t.integer :lease_buyout_cost
      t.references :driver, foreign_key: true
      t.datetime :deleted_at
      t.string :deleted_by

      t.timestamps
    end
  end
end
