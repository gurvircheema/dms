class CreateDrivers < ActiveRecord::Migration[5.2]
  def change
    create_table :drivers do |t|
      t.string :name,             null: false
      t.string :phone,            null: false
      t.string :cell
      t.string :email,            null: false
      t.date :date_of_birth
      t.boolean :active,          null: false, default: true
      t.integer :immigration_status, null: false, default: 0
      t.integer :driver_type,     null: false, default: 0
      t.datetime :deleted_at
      t.string :deleted_by

      t.timestamps
    end

    add_index :drivers, [:name, :email], unique: true
  end
end
