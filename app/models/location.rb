class Location < ApplicationRecord
  belongs_to :customer
  has_one :address

  validates_presence_of :name

  default_scope { where(deleted_at: nil) }
  
  accepts_nested_attributes_for :address

  def primary_address
    address || Address.new
  end
end
