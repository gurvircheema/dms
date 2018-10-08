require 'rails_helper'

RSpec.describe Vendor, type: :model do
  it { is_expected.to validate_presence_of(:internal_name) }
  it { is_expected.to validate_presence_of(:legal_name) }
  it { is_expected.to validate_presence_of(:remit_name) }
  it { is_expected.to validate_presence_of(:vendor_type) }
end
