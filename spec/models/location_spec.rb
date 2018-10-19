require 'rails_helper'

RSpec.describe Location, type: :model do
  it { is_expected.to belong_to(:customer) }
  it { is_expected.to have_one(:address) }

  it { is_expected.to validate_presence_of(:name) }
end
