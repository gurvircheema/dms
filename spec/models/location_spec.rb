require 'rails_helper'

RSpec.describe Location, type: :model do
  it { is_expected.to belong_to(:customer) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:address) }
  it { is_expected.to validate_presence_of(:city) }
  it { is_expected.to validate_presence_of(:province) }
  it { is_expected.to validate_presence_of(:country) }
end
