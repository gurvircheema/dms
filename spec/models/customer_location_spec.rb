require 'rails_helper'

RSpec.describe CustomerLocation, type: :model do
  it { is_expected.to belong_to(:customer) }
  it { is_expected.to belong_to(:location) }
end
