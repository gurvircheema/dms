class Load < ApplicationRecord
  belongs_to :customer
  belongs_to :driver, optional: true
  belongs_to :vendor, optional: true
  has_many :pickup_locations
  has_many :drop_locations

  validates_presence_of :customer_ref_number
  validates_inclusion_of :currency, in: Currency.list

  accepts_nested_attributes_for :pickup_locations
  accepts_nested_attributes_for :drop_locations
end
