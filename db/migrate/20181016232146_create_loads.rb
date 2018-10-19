class CreateLoads < ActiveRecord::Migration[5.2]
  def change
    create_table :loads do |t|
      t.string :customer_ref_number
      t.integer :customer_rate,     precision: 10, scale: 2
      t.string :currency,           null: false
      t.string :customer_notes
      t.string :equipment_type,     null: false
      t.decimal :vendor_cost,       precision: 10, scale: 2
      t.boolean :picked_up,         null: false, default: false
      t.boolean :delivered,         null: false, default: false
      t.boolean :invoiced,          null: false, default: false
      t.boolean :payment_received,  null: false, default: false
      t.boolean :paid_to_vendor,    null: false, default: false
      t.datetime :deleted_at
      t.string :deleted_by

      t.references :customer, foreign_key: true
      t.references :driver, foreign_key: true
      t.references :vendor, foreign_key: true
      t.timestamps
    end
  end
end
