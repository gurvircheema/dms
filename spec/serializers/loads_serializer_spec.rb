require 'rails_helper'

RSpec.describe LoadSerializer do
  let(:customer) { create(:customer, name: 'Mr Customer') }
  let(:vendor) do
    create(:vendor, vendor_type: :carrier_canadian, internal_name: 'Vendor Name')
  end
  let(:driver) { create(:driver, name: 'Mr Driver') }
  let(:load) { create(:load, customer: customer, vendor: vendor, driver: driver) }
  let(:address) { create(:address, city: 'Abbotsford', state_province: 'BC') }
  let(:location) { create(:location, address: address) }
  let!(:pickup_location) { create(:pickup_location, load: load, location: location) }
  let!(:drop_location) { create(:drop_location, load: load, location: location) }

  let(:expected_keys) { keys }
  let(:response) { described_class.new(load).serialized_json }
  let(:parsed_response) { JSON.parse(response)['data']['attributes'] }

  it 'has the expected keys' do
    expect(parsed_response.keys).to eq(expected_keys)
  end

  it 'has expected values' do
    expect(parsed_response['customer_name']).to eq('Mr Customer')
    expect(parsed_response['pickup_location']).to eq('Abbotsford, BC')
    expect(parsed_response['dropoff_location']).to eq('Abbotsford, BC')
    expect(parsed_response['vendor_name']).to eq('Vendor Name')
    expect(parsed_response['driver_name']).to eq('Mr Driver')
  end

  private

  def keys
    %w[
      id customer_ref_number currency customer_notes
      equipment_type vendor_cost picked_up delivered
      invoiced payment_received paid_to_vendor deleted_by
      customer_id driver_id vendor_id created_at
      updated_at customer_rate deleted_at customer_name
      pickup_location dropoff_location vendor_name driver_name
    ]
  end
end
