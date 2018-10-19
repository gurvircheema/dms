FactoryBot.define do
  factory :pickup_location do
    ref_number { 'PO12346' }
    commodity { 'Steel' }
    currency { 'CAD' }
  end
end