class CreateTicketViolations < ActiveRecord::Migration[5.2]
  def change
    create_table :ticket_violations do |t|
      t.references :driver, foreign_key: true
      t.string :motor_vehicle_act_section
      t.string :description
      t.integer :fine_amount
      t.integer :points_deducted

      t.timestamps
    end
  end
end
