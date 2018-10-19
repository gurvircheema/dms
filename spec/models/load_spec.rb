require 'rails_helper'

RSpec.describe Load, type: :model do
  it { is_expected.to have_many(:pickup_locations) }
  it { is_expected.to have_many(:drop_locations) }
  it { is_expected.to belong_to(:customer) }
  it { is_expected.to belong_to(:driver) }
  it { is_expected.to belong_to(:vendor) }

  it { is_expected.to validate_presence_of(:customer_ref_number) }
  it { is_expected.to validate_presence_of(:currency) }
  it { is_expected.to validate_presence_of(:equipment_type) }
end
