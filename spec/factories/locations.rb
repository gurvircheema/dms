FactoryBot.define do
  factory :location do
    name { FFaker::Company.name }
    address
  end
end
