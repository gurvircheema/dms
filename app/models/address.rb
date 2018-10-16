class Address < ApplicationRecord
  belongs_to :location, optional: true
  belongs_to :customer, optional: true
  belongs_to :vendor, optional: true
  belongs_to :driver, optional: true

  validates_presence_of :city, :state_province, :country
  validates_inclusion_of :country, in: Country.list.values
  validates_inclusion_of :state_province, in: State.list.keys

  default_scope { where(deleted_at: nil) }
end
