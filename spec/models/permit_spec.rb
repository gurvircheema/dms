require 'rails_helper'

RSpec.describe Permit, type: :model do
  it { should belong_to(:equipment) }

  it { is_expected.to validate_presence_of(:permit_type) }
  it { is_expected.to validate_presence_of(:permit_number) }
  it { is_expected.to validate_presence_of(:state_province) }
  it { is_expected.to validate_presence_of(:expiry_date) }

  it { is_expected.to allow_value(true).for(:reminder)}
  it { is_expected.to allow_value(false).for(:reminder)}
  it { is_expected.to_not allow_value(nil).for(:reminder)}
end
