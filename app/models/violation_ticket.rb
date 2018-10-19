class ViolationTicket < ApplicationRecord
  belongs_to :driver
  has_one_attached :ticket

  validates_presence_of :motor_vehicle_act_section, :description, :fine_amount,
                        :points_deducted
  default_scope { where(deleted_at: nil) }
end
