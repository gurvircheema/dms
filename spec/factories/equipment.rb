FactoryBot.define do
  factory :equipment do
    unit_number { Random.rand(100..110) }
    unit_type { 'truck' }
    owned_by_company { FFaker::Company.name }
    active_date { FFaker::Time.between(3.years.ago, 2.years.ago) }
    license_plate { FFaker::Identification.drivers_license[0..9] }
    license_plate_state { FFaker::AddressCA.province_abbr }
    vin { FFaker::Vehicle.vin }
    make { FFaker::Vehicle.make }
    model { FFaker::Vehicle.model }
    year { FFaker::Vehicle.model }
    fuel_type { 'diesel' }
    leased_vehicle { FFaker::Boolean.random }
    lease_company { FFaker::Company.name }
    lease_end_date { FFaker::Time.between(10.months.from_now, 2.years.from_now) }
  end
end
