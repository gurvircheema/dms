FactoryBot.define do
  factory :location do
    name { FFaker::Company.name }
    address { FFaker::AddressCA.street_address }
    city { FFaker::AddressCA.city }
    province { FFaker::AddressCA.province_abbr }
    country { 'Canada' }
  end
end
