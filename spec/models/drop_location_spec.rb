require 'rails_helper'

RSpec.describe DropLocation, type: :model do
  it { is_expected.to belong_to(:location) }
  it { is_expected.to belong_to(:load) }
end
