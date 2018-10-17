class CreatePickupLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :pickup_locations do |t|
      t.datetime :appt_date
      t.string :ref_number
      t.string :contact
      t.integer :skids
      t.integer :cases
      t.decimal :weight, precision: 10, scale: 2 
      t.boolean :ltl, null: false, default: false
      t.string :commodity
      t.string :notes
      t.datetime :deleted_at
      t.string :deleted_by
      t.references :location, foreign_key: true
      t.references :load, foreign_key: true

      t.timestamps
    end
  end
end
