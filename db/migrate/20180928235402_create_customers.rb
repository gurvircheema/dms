class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name,       null: false
      t.string :address
      t.string :city,       null: false
      t.string :province,   null: false
      t.string :country
      t.string :zip
      t.string :phone
      t.string :toll_free
      t.string :fax
      t.string :email,      null: false
      t.string :billing_address
      t.string :billing_city
      t.string :billing_province
      t.string :billing_country
      t.string :billing_zip

      t.timestamps
    end

    add_index :customers, :name, unique: true
    add_index :customers, :email, unique: true
  end
end
