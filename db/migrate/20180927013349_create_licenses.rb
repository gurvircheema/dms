class CreateLicenses < ActiveRecord::Migration[5.2]
  def change
    create_table :licenses do |t|
      t.string :number,     null: false
      t.date :issue_date,   null: false
      t.date :expiry_date,  null: false
      t.string :restrictions
      t.string :province
      t.references :driver, foreign_key: true

      t.timestamps
    end
    add_index :licenses, :number, unique: true
  end
end
