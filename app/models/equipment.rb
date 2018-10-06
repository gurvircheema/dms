class Equipment < ApplicationRecord
  has_many :permits
  belongs_to :driver, optional: true
  validates_presence_of :unit_number, :unit_type, :owned_by_company,
    :active_date, :make, :model, :year, :fuel_type, :vin

  enum unit_type: {
    truck: 'truck',
    trailer: 'trailer'
  }
  enum fuel_type: {
    diesel: 'diesel',
    gas: 'gas',
    unknown: 'unknown'
  }
end
