FactoryBot.define do
  factory :license do
    number { FFaker::Number.license }
    issue_date { Date.between(4.years.ago, 2.years.ago) }
    expiry_date { Date.between(1.years.from_now, 2.years.from_now) }
  end
end
