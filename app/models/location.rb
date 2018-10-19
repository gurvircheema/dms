class Location < ApplicationRecord
  belongs_to :customer, optional: true
  has_one :address
  has_many :customer_locations

  validates_presence_of :name

  default_scope { where(deleted_at: nil) }

  accepts_nested_attributes_for :address, reject_if: :all_blank

  def primary_address
    address || Address.new
  end

  def dropdown_list_item
    [
      "#{name}: #{primary_address.address_line_1}, " +
      "#{primary_address.city} #{primary_address.state_province}",
      id
    ]
  end
end
