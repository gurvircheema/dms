require 'rails_helper'

RSpec.describe Company, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:contact) }
  it { is_expected.to validate_presence_of(:phone) }
  it { is_expected.to validate_presence_of(:fax) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:website) }
  it { is_expected.to validate_presence_of(:state) }
  it { is_expected.to validate_presence_of(:currency) }
  it { is_expected.to validate_presence_of(:last_invoice) }

  it { is_expected.to allow_value('BC').for(:state) }
  it { is_expected.not_to allow_value('BCA').for(:state) }
  it { is_expected.to allow_value('CAD').for(:currency) }
  it { is_expected.not_to allow_value('AUD').for(:currency) }
end
