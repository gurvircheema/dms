class Driver < ApplicationRecord
  enum ability_to_work: [:citizenship, :permanent_residence, :work_permit]
  enum driver_type: [:company_driver, :owner_operator]

  validates_presence_of :name, :city, :state, :country, :phone, :email, :active
end
