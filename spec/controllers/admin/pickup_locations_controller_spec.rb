require 'rails_helper'

RSpec.describe Admin::PickupLocationsController, type: :controller do
  let(:customer) { FactoryBot.create(:customer) }
  let(:load) { FactoryBot.create(:load, customer: customer) }
  let(:address) { FactoryBot.create(:address) }
  let(:location) { FactoryBot.create(:location, address: address) }
  let(:pickup_location) { FactoryBot.create(:pickup_location, load: load, location: location) }
  before { sign_in_admin_user }

  describe 'GET #new' do
    before { get :new, params: { load_id: load.id } }

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end

    it 'returns the 200 status code' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    let(:attrs) { FactoryBot.attributes_for(:pickup_location, location_id: location.id) }
    let(:post_request) { post :create, params: { load_id: load.id, pickup_location: attrs } }

    it 'creates the pickup location' do
      expect { post_request }.to change(PickupLocation, :count).by(1)
    end

    it 'returns to load page' do
      post_request
      expect(response).to redirect_to([:admin, load])
    end
  end
end
