class Location < ApplicationRecord
  belongs_to :customer
  has_one :address
  validates_presence_of :name

  accepts_nested_attributes_for :address
end
