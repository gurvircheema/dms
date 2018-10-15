class Address < ApplicationRecord
  validates_presence_of :city, :state_province, :country
  validates_inclusion_of :country, in: Country.list.values
  validates_inclusion_of :state_province, in: State.list.keys

  belongs_to :location, optional: true
  belongs_to :customer, optional: true
  belongs_to :vendor, optional: true
  belongs_to :driver, optional: true
end
