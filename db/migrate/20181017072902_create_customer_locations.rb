class CreateCustomerLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_locations do |t|
      t.references :customer, foreign_key: true
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
