class CreateDrivers < ActiveRecord::Migration[5.2]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :country, default: 'Canada'
      t.string :zip
      t.string :phone
      t.string :cell
      t.string :email
      t.date :date_of_birth
      t.boolean :active, default: true
      t.integer :ability_to_work, default: 0
      t.integer :driver_type, default: 0

      t.timestamps
    end
  end
end
