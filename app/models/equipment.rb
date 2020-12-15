class Equipment < ApplicationRecord
  include SoftDeletable
  has_many :permits
  has_many :notes, as: :notable
  belongs_to :driver, optional: true

  validates_presence_of :unit_number, :unit_type, :owned_by_company,
                        :active_date, :make, :model, :year, :fuel_type, :vin

  enum unit_type: %i[truck trailer]
  enum fuel_type: %i[diesel gas unknown]
end
