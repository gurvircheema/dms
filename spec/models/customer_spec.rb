require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { is_expected.to have_many(:locations) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:city) }
  it { is_expected.to validate_presence_of(:province) }
  it { is_expected.to validate_presence_of(:email) }

  # it { is_expected.to validate_uniqueness_of(:name) }
  # it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to allow_value('email@address.com').for(:email) }
  it { is_expected.to_not allow_value('email').for(:email) }
  it { is_expected.to_not allow_value('emailgmail').for(:email) }
end
