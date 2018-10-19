FactoryBot.define do
  factory :drop_location do
    ref_number { 'DO12346' }
    appt_date { Time.now }
    commodity { 'Steel' }
    currency { 'CAD' }
  end
end