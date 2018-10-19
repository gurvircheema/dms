FactoryBot.define do
  factory :drop_location do
    ref_number { 'DO12346' }
    commodity { 'Steel' }
    currency { 'CAD' }
  end
end