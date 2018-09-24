FactoryBot.define do
  factory :driver do
    name { FFaker::Name.name }
    address { FFaker::AddressCA.street_name }
    city { FFaker::AddressCA.city }
    state { FFaker::AddressCA.province_abbr }
    country { 'Canada' }
    zip { FFaker::AddressCA.postal_code }
    phone { FFaker::PhoneNumber.phone_number }
    cell { FFaker::PhoneNumber.phone_number }
    email { FFaker::Internet.email }
    date_of_birth { FFaker::Time.between(30.years.ago, 21.years.ago) }
    active { true }
    ability_to_work { :citizenship }
    driver_type { :company_driver }
  end
end
