FactoryBot.define do
  factory :vendor do
    internal_name { FFaker::Company.name }
    legal_name { FFaker::Company.name }
    remit_name { FFaker::Company.name }
    vendor_type { :carrier_canadian }
  end
end
