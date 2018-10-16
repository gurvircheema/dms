class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state_province
      t.string :country
      t.string :zipcode
      t.references :location, foreign_key: true
      t.references :customer, foreign_key: true
      t.references :vendor, foreign_key: true
      t.references :driver, foreign_key: true
      t.datetime :deleted_at
      t.string :deleted_by
      t.timestamps
    end
  end
end
