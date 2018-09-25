require 'rails_helper'

RSpec.describe TicketViolation, type: :model do
  it { is_expected.to validate_presence_of(:motor_vehicle_act_section) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:fine_amount) }
  it { is_expected.to validate_presence_of(:points_deducted) }
  it { should belong_to(:driver) }
end
