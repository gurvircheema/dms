class Equipment < ApplicationRecord
  has_many :permits
  has_many :notes, as: :notable
  belongs_to :driver, optional: true

  validates_presence_of :unit_number, :unit_type, :owned_by_company,
    :active_date, :make, :model, :year, :fuel_type, :vin

  default_scope { where(deleted_at: nil) }

  enum unit_type: [:truck, :trailer]
  enum fuel_type: [:diesel, :gas, :unknown]
end
