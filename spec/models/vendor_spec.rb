require 'rails_helper'

RSpec.describe Vendor, type: :model do
  it { is_expected.to have_many(:notes) }
  it { is_expected.to have_one(:address) }
  it { is_expected.to have_one(:remit_address) }
  it { is_expected.to validate_presence_of(:internal_name) }
  it { is_expected.to validate_presence_of(:legal_name) }
  it { is_expected.to validate_presence_of(:remit_name) }
  it { is_expected.to validate_presence_of(:vendor_type) }
end
