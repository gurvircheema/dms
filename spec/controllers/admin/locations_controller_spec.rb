require 'rails_helper'

RSpec.describe Admin::LocationsController, type: :controller do
  let(:customer) { FactoryBot.create(:customer) }
  let(:location) { FactoryBot.create(:location, customer: customer) }
  let(:request_params) { { customer_id: customer.id, id: location.id } }
  before { sign_in_admin_user }

  describe 'POST #create' do
    let(:post_request) do
      post :create, params: { customer_id: customer.id, location: FactoryBot.attributes_for(:location) }
    end

    it 'creates a new location' do
      expect { post_request }.to change(Location, :count).by(1)
    end

    it 'redirects to customer page' do
      post_request
      expect(response).to redirect_to([:admin, customer])
    end
  end

  describe "GET #show" do
    before { get :show, params: request_params }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'returns the location' do
      expect(assigns(:location)[:name]).to eq(location.name)
    end
  end

  describe "GET #edit" do
    before { get :edit, params: request_params }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'render the edit template' do
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT #update' do
    before do
      put :update,
        params: request_params.merge({ location: { name: 'Samuel CPP'} })
    end

    it 'updates the location' do
      location.reload
      expect(location.name).to eq('Samuel CPP')
    end
  end
end
