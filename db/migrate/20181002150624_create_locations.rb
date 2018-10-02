class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :province
      t.string :country
      t.string :zip
      t.string :contact
      t.string :email
      t.string :phone
      t.string :toll_free
      t.string :fax
      t.text :loading_info
      t.text :receiving_info
      t.text :additional_info
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
