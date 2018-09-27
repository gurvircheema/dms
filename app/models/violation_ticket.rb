class ViolationTicket < ApplicationRecord
  belongs_to :driver
  validates_presence_of :motor_vehicle_act_section, :description, :fine_amount,
                        :points_deducted
  has_one_attached :ticket
end
