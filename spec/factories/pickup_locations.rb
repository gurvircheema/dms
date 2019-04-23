FactoryBot.define do
  factory :pickup_location do
    ref_number { 'PO12346' }
    appt_date { Time.now }
    commodity { 'Steel' }
    location
  end
end
