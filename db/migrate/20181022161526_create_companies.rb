class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name,           null: false
      t.references :address,    foreign_key: true
      t.string :contact,        null: false
      t.date :starting_date,    null: false
      t.string :phone,          null: false
      t.string :fax,            null: false
      t.string :email,          null: false
      t.string :website,        null: false
      t.string :hst_num
      t.decimal :hst_percentage, precision: 10, scale: 2
      t.string :pst_num
      t.decimal :pst_percentage, precision: 10, scale: 2
      t.string :gst_num
      t.decimal :gst_percentage, precision: 10, scale: 2
      t.string :factory_company
      t.string :us_dot
      t.string :mc_num
      t.string :cvor_num
      t.string :currency,       null: false
      t.string :state,          null: false
      t.string :scac_code
      t.string :carrier_code
      t.string :last_invoice, null: false, default: 1
      t.string :terms_for_customer_invoice
      t.string :terms_conditions_for_carrier
      t.string :notes_for_bol
      t.string :notes_for_factor_invoice
      t.string :notes_on_reminder_letter

      t.timestamps
    end
  end
end
