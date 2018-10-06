require 'rails_helper'

RSpec.describe Permit, type: :model do
  it { should belong_to(:equipment) }

  it { is_expected.to validate_presence_of(:permit_type) }
  it { is_expected.to validate_presence_of(:permit_number) }
  it { is_expected.to validate_presence_of(:state_province) }
  it { is_expected.to validate_presence_of(:expiry_date) }

  it { is_expected.to validate_inclusion_of(:reminder).in_array([true, false]) }
end
