require 'rails_helper'

RSpec.describe Note, type: :model do
  it { should belong_to(:user) }

  it { is_expected.to have_db_column(:notable_id).of_type(:integer) }
  it { is_expected.to have_db_column(:notable_type).of_type(:string) }
  it { is_expected.to belong_to(:notable) }

  it { is_expected.to validate_presence_of(:subject) }
  it { is_expected.to validate_presence_of(:description) }
end
