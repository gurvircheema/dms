require 'rails_helper'

RSpec.describe License, type: :model do
  it { should belong_to(:driver) }
  it { is_expected.to validate_presence_of(:number) }
  it { is_expected.to validate_presence_of(:issue_date) }
  it { is_expected.to validate_presence_of(:expiry_date) }
end
