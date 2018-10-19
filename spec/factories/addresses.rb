FactoryBot.define do
  factory :address do
    address_line_1 { FFaker::AddressCA.street_address }
    city { FFaker::AddressCA.city }
    state_province { FFaker::AddressCA.province_abbr }
    country { 'Canada' }
    zipcode { FFaker::AddressCA.postal_code }
  end
end