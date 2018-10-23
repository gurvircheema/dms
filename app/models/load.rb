class Load < ApplicationRecord
  include SoftDeletable
  belongs_to :customer
  belongs_to :driver, optional: true
  belongs_to :vendor, optional: true
  has_many :pickup_locations
  has_many :drop_locations

  validates_presence_of :customer_ref_number, :currency, :equipment_type
  validates_inclusion_of :currency, in: Currency.list
  validates_inclusion_of :equipment_type, in: EquipmentType.list

  accepts_nested_attributes_for :pickup_locations, reject_if: :persisted?
  accepts_nested_attributes_for :drop_locations, reject_if: :persisted?
end
