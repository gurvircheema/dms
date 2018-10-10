class Location < ApplicationRecord
  belongs_to :customer
  validates_presence_of :name, :address, :city, :province, :country
end
