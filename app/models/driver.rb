class Driver < ApplicationRecord
  enum immigration_status: [:canadian_citizen, :permanent_resident, :work_permit, :student_permit]
  enum driver_type: [:company_driver, :owner_operator]

  has_many :violation_tickets
  has_many :licenses
  validates_presence_of :name, :city, :state, :country, :phone, :email, :active
end
