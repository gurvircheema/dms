class CreatePermits < ActiveRecord::Migration[5.2]
  def change
    create_table :permits do |t|
      t.string :permit_type
      t.string :permit_number
      t.string :state_province
      t.date :expiry_date
      t.boolean :reminder, null: false, default: false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
