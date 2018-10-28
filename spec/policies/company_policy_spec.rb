require 'rails_helper'

describe CompanyPolicy do
	let(:user) { FactoryBot.create(:user) }
	let(:admin_role) { FactoryBot.create(:role, name: 'admin') }
	let(:dispatcher_role) { FactoryBot.create(:role, name: 'dispatcher') }
  let(:driver_role) { FactoryBot.create(:role, name: 'driver') }
  let(:address) { FactoryBot.create(:address) }
	let(:company) { FactoryBot.create(:company, address: address) }

	subject { CompanyPolicy.new(user, company) }

	context 'user is admin' do
		let(:user) { FactoryBot.create(:user, admin: true )}

		it { should permit_action(:show) }
		it { should permit_action(:edit) }
		it { should permit_action(:update) }
	end

	context 'admin role' do
		before { assign_role!(user, admin_role) }

		it { should permit_action(:show) }
		it { should permit_action(:edit) }
		it { should permit_action(:update) }
	end

	context 'dispatcher role' do
		before { assign_role!(user, dispatcher_role) }

		it { should permit_action(:show) }
		it { should_not permit_action(:edit) }
		it { should_not permit_action(:update) }
	end

	context 'driver role' do
		before { assign_role!(user, driver_role) }

		it { should_not permit_action(:show) }
		it { should_not permit_action(:edit) }
		it { should_not permit_action(:update) }
	end
end