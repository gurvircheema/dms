class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name,       null: false
      t.string :phone
      t.string :toll_free
      t.string :fax
      t.string :email, null: false
      t.datetime :deleted_at
      t.string :deleted_by

      t.timestamps
    end

    add_index :customers, :name,  unique: true
    add_index :customers, :email, unique: true
  end
end
