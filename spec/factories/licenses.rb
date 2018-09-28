FactoryBot.define do
  factory :license do
    number { FFaker::Identification.drivers_license }
    issue_date { FFaker::Time.between(4.years.ago, 2.years.ago) }
    expiry_date { FFaker::Time.between(1.years.from_now, 2.years.from_now) }
  end
end
