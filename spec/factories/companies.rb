FactoryBot.define do
  factory :company do
    name { FFaker::Company.name }
    address { FFaker::AddressCA.street_address }
    city { FFaker::AddressCA.city }
    province { FFaker::AddressCA.province_abbr }
    country { 'Canada' }
    zip { FFaker::AddressCA.postal_code }
    billing_address { FFaker::AddressCA.street_address }
    billing_city { FFaker::AddressCA.city }
    billing_province { FFaker::AddressCA.province_abbr }
    billing_country { 'Canada' }
    billing_zip { FFaker::AddressCA.postal_code }
    phone { FFaker::PhoneNumber.phone_number }
    toll_free { FFaker::PhoneNumber.short_phone_number }
    fax { FFaker::PhoneNumber.short_phone_number }
    email { FFaker::Internet.safe_email }
    customer { FFaker::Boolean.random }
    carrier { FFaker::Boolean.random }
  end
end
