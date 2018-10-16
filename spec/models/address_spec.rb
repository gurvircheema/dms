require 'rails_helper'

RSpec.describe Address, type: :model do
  it { is_expected.to validate_presence_of(:city) }
  it { is_expected.to validate_presence_of(:state_province) }
  it { is_expected.to validate_presence_of(:country) }

  it { is_expected.to allow_value('Canada').for(:country) }
  it { is_expected.to allow_value('United States').for(:country) }
  it { is_expected.to_not allow_value('UK').for(:country) }
  it { is_expected.to_not allow_value('').for(:country) }

  it { is_expected.to belong_to(:driver) }
  it { is_expected.to belong_to(:vendor) }
  it { is_expected.to belong_to(:customer) }
  it { is_expected.to belong_to(:location) }
end
