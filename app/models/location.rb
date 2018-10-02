class Location < ApplicationRecord
  belongs_to :company
  validates_presence_of :name, :address, :city, :province, :country
end
