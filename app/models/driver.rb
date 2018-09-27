class Driver < ApplicationRecord
  enum ability_to_work: [:citizenship, :permanent_residence, :work_permit]
  enum driver_type: [:company_driver, :owner_operator]

  has_many :violation_tickets
  has_one :license
  validates_presence_of :name, :city, :state, :country, :phone, :email, :active
end
