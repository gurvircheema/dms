class Driver < ApplicationRecord
  include SoftDeletable
  has_many :violation_tickets
  has_many :licenses
  has_one :address

  validates_presence_of :name, :phone, :email, :active

  accepts_nested_attributes_for :address

  enum immigration_status: [:canadian_citizen, :permanent_resident, :work_permit, :student_permit]
  enum driver_type: [:company_driver, :owner_operator]
end
