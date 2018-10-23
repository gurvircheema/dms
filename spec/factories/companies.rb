FactoryBot.define do
  factory :company do
    name { FFaker::Company.name }
    contact { FFaker::Name.name }
    starting_date { FFaker::Time.between(4.years.ago, 1.year.ago)}
    phone { FFaker::PhoneNumber.short_phone_number }
    fax { FFaker::PhoneNumber.short_phone_number }
    email { FFaker::Internet.email }
    website { FFaker::Internet.http_url }
    currency { 'CAD' }
    state { FFaker::AddressCA.province_abbr }
    last_invoice { '0' }
  end
end