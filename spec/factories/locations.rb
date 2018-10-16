FactoryBot.define do
  factory :location do
    name { FFaker::Company.name }
  end
end
