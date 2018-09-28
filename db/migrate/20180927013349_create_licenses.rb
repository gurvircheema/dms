class CreateLicenses < ActiveRecord::Migration[5.2]
  def change
    create_table :licenses do |t|
      t.string :number
      t.date :issue_date
      t.date :expiry_date
      t.string :restrictions
      t.string :province
      t.references :driver, foreign_key: true

      t.timestamps
    end
  end
end
