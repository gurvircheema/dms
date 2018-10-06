FactoryBot.define do
  factory :permit do
    permit_type { 'Wide load permit' }
    permit_number { FFaker::IdentificationESCL.rut }
    state_province { FFaker::AddressCA.province_abbr }
    expiry_date { FFaker::Time.between(3.months.ago, 1.month.from_now) }
    reminder { FFaker::Boolean.random }
  end
end
