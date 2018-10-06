class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :notable_type
      t.integer :notable_id
      t.string :subject
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
