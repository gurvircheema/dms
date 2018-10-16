class CreatePermits < ActiveRecord::Migration[5.2]
  def change
    create_table :permits do |t|
      t.string :permit_type,    null: false
      t.string :permit_number,  null: false
      t.string :state_province, null: false
      t.date :expiry_date,      null: false
      t.boolean :reminder,      null: false, default: false
      t.datetime :deleted_at
      t.references :equipment,  foreign_key: true
      t.datetime :deleted_at
      t.string :deleted_by

      t.timestamps
    end
  end
end
