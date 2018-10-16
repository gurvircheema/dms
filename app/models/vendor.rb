class Vendor < ApplicationRecord
  has_many :notes, as: :notable
  has_one :address
  has_one :remit_address, class_name: 'Address', foreign_key: :vendor_id

  validates_presence_of :internal_name, :legal_name, :remit_name, :vendor_type

  default_scope { where(deleted_at: nil) }
  
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :remit_address

  before_save :set_remit_address

  enum vendor_type: [
    :carrier_canadian,
    :carrier_us,
    :carrier_mexico,
    :carrier_intermodal,
    :carrier_local_cartage,
    :carrier_air_freight,
    :carrier_ocean_freight,
    :owner_operator_us,
    :owner_operator_canada,
    :owner_operator_local,
    :customs_broker,
    :freight_broker,
    :freight_forwarder,
    :vendor_bank,
    :vendor_contract_labour,
    :vendor_crane,
    :vendor_crating,
    :vendor_destuffing,
    :vendor_insurance,
    :vendor_equipment,
    :vendor_fuel,
    :vendor_fuel_tax,
    :vendor_government_services,
    :vendor_maintenance,
    :vendor_pilot_car,
    :vendor_port_facility,
    :vendor_tire,
    :vendor_towing,
    :vendor_trailer_rentals,
    :vendor_truck_rentals,
    :vendor_warehousing,
    :other
  ]

  def set_remit_address
    if self.remit_same_as_primary_address?
      self.remit_address = self.address
      self.remit_phone = self.phone
      self.remit_toll_free = self.toll_free
      self.remit_fax = self.fax
    end
  end

  def primary_address
    address || Address.new
  end

  def remittance_address
    remit_address || Address.new
  end
end
