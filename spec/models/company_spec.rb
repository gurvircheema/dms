require 'rails_helper'

RSpec.describe Company, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:city) }
  it { is_expected.to validate_presence_of(:province) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_inclusion_of(:is_customer).in_array([true, false]) }
  it { is_expected.to validate_inclusion_of(:is_carrier).in_array([true, false]) }

  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to allow_value('email@address.com').for(:email) }
  it { is_expected.to_not allow_value('email').for(:email) }
  it { is_expected.to_not allow_value('email@gmail').for(:email) }
end
