class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :province
      t.string :country
      t.string :zip
      t.string :phone
      t.string :toll_free
      t.string :fax
      t.string :email
      t.string :billing_address
      t.string :billing_city
      t.string :billing_province
      t.string :billing_country
      t.string :billing_zip
      t.boolean :is_customer
      t.boolean :is_carrier

      t.timestamps
    end
  end
end
