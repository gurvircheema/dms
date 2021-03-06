require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:user_roles) }
  it { is_expected.to have_many(:roles) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }

  it { is_expected.to allow_value(true).for(:admin) }
  it { is_expected.to allow_value(false).for(:admin) }
  it { is_expected.to_not allow_value(nil).for(:admin) }
end
