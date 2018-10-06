require 'rails_helper'

RSpec.describe Equipment, type: :model do
  it { is_expected.to belong_to(:driver) }
  it { is_expected.to have_many(:permits) }
  it { is_expected.to have_many(:notes) }

  it { is_expected.to validate_presence_of(:unit_number) }
  it { is_expected.to validate_presence_of(:unit_type) }
  it { is_expected.to validate_presence_of(:owned_by_company) }
  it { is_expected.to validate_presence_of(:active_date) }
  it { is_expected.to validate_presence_of(:make) }
  it { is_expected.to validate_presence_of(:model) }
  it { is_expected.to validate_presence_of(:year) }
  it { is_expected.to validate_presence_of(:fuel_type) }
  it { is_expected.to validate_presence_of(:vin) }
end
