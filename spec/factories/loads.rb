FactoryBot.define do
  factory :load do
    customer_ref_number { 'LCA12346' }
    currency { 'CAD' }
    equipment_type { 'Super B' }
  end
end