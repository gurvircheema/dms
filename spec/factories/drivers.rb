FactoryBot.define do
  factory :driver do
    name { FFaker::Name.name }
    email { FFaker::Internet.email }
    phone { FFaker::PhoneNumber.short_phone_number }
    cell { FFaker::PhoneNumber.phone_number }
    date_of_birth { FFaker::Time.between(30.years.ago, 21.years.ago) }
    active { true }
    immigration_status { :canadian_citizen }
    driver_type { :company_driver }
  end
end
