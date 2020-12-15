class CreateViolationTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :violation_tickets do |t|
      t.references :driver, foreign_key: true
      t.string :motor_vehicle_act_section, null: false
      t.string :description,      null: false
      t.integer :fine_amount,     null: false, default: 0
      t.integer :points_deducted, null: false, default: 0
      t.date :issue_date
      t.string :issue_place
      t.datetime :deleted_at
      t.string :deleted_by

      t.timestamps
    end
  end
end
