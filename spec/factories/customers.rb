FactoryBot.define do
  factory :customer do
    sequence(:name){|n| "#{FFaker::Company.name}#{n}" }
    phone { FFaker::PhoneNumber.phone_number }
    toll_free { FFaker::PhoneNumber.short_phone_number }
    fax { FFaker::PhoneNumber.short_phone_number }
    email { FFaker::Internet.safe_email }
  end
end
