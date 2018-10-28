require 'rails_helper'

describe LocationPolicy do
	let(:user) { FactoryBot.create(:user) }
	let(:admin_role) { FactoryBot.create(:role, name: 'admin') }
	let(:dispatcher_role) { FactoryBot.create(:role, name: 'dispatcher') }
	let(:driver_role) { FactoryBot.create(:role, name: 'driver') }
	let(:location) { FactoryBot.create(:location) }

	subject { LocationPolicy.new(user, location) }

	context 'user is admin' do
		let(:user) { FactoryBot.create(:user, admin: true )}

		it { should permit_action(:index) }
		it { should permit_action(:new) }
		it { should permit_action(:create) }
		it { should permit_action(:show) }
		it { should permit_action(:edit) }
		it { should permit_action(:update) }
		it { should permit_action(:destroy) }
	end

	context 'admin role' do
		before { assign_role!(user, admin_role) }

		it { should permit_action(:index) }
		it { should permit_action(:new) }
		it { should permit_action(:create) }
		it { should permit_action(:show) }
		it { should permit_action(:edit) }
		it { should permit_action(:update) }
		it { should permit_action(:destroy) }
	end

	context 'dispatcher role' do
		before { assign_role!(user, dispatcher_role) }

		it { should permit_action(:index) }
		it { should permit_action(:new) }
		it { should permit_action(:create) }
		it { should permit_action(:show) }
		it { should permit_action(:edit) }
		it { should permit_action(:update) }
		it { should permit_action(:destroy) }
	end

	context 'driver role' do
		before { assign_role!(user, driver_role) }

		it { should_not permit_action(:index) }
		it { should_not permit_action(:new) }
		it { should_not permit_action(:create) }
		it { should_not permit_action(:show) }
		it { should_not permit_action(:edit) }
		it { should_not permit_action(:update) }
		it { should_not permit_action(:destroy) }
	end
end