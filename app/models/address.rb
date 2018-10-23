class Address < ApplicationRecord
  include SoftDeletable
  belongs_to :location, optional: true
  belongs_to :customer, optional: true
  belongs_to :vendor, optional: true
  belongs_to :driver, optional: true

  validates_presence_of :city, :state_province, :country
  validates_inclusion_of :country, in: Country.list.values
  validates_inclusion_of :state_province, in: State.list.keys

  def full_address
    "#{address_line_1}, #{city}, #{state_province} #{zipcode}"
  end

  def partial_address
    "#{city}, #{state_province}"
  end
end
