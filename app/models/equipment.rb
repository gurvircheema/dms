class Equipment < ApplicationRecord
  has_many :permits
  belongs_to :driver, optional: true
  has_many :notes, as: :notable

  validates_presence_of :unit_number, :unit_type, :owned_by_company,
    :active_date, :make, :model, :year, :fuel_type, :vin

  enum unit_type: [:truck, :trailer]
  enum fuel_type: [:diesel, :gas, :unknown]
end
