class Permit < ApplicationRecord
  include SoftDeletable
  belongs_to :equipment
  validates_presence_of :permit_type, :permit_number, :state_province,
                        :expiry_date
  validates_inclusion_of :reminder, in: [true, false]
end
