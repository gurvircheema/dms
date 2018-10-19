class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name,         null: false
      t.string :contact
      t.string :email
      t.string :phone
      t.string :toll_free
      t.string :fax
      t.text :loading_info
      t.text :receiving_info
      t.text :additional_info
      t.references :customer, foreign_key: true
      t.datetime :deleted_at
      t.string :deleted_by

      t.timestamps
    end

    add_index :locations, :name, unique: true
  end
end
