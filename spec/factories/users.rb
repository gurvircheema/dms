FactoryBot.define do
  factory :user do
    name { FFaker::Name.name }
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }
    admin { false }
  end
end
