FactoryBot.define do
  factory :violation_ticket do
    motor_vehicle_act_section { '86(1)' }
    description { FFaker::Lorem.sentence }
    fine_amount { Random.rand(150..500) }
    points_deducted { Random.rand(0..3) }
  end
end
