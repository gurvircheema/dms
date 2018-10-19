require 'rails_helper'

RSpec.describe Admin::CustomerLocationsController, type: :controller do
  let(:customer) { FactoryBot.create(:customer) }
  let(:location) { FactoryBot.create(:location) }
  let(:customer_location) { FactoryBot.create(:customer_location, customer: customer, location: location) }

  before { sign_in_admin_user }

  describe 'GET #new' do
    before { get :new, params: { customer_id: customer.id } }

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    let(:attrs) { FactoryBot.attributes_for(:customer_location, customer_id: customer.id, location_id: location.id) }
    let(:post_request) { post :create, params: { customer_id: customer.id, customer_location: attrs } }

    it 'creates a new customer location' do
      expect { post_request }.to change(CustomerLocation, :count).by(1)
    end

    it 'redirects to customer after creation' do
      post_request
      expect(response).to redirect_to([:admin, customer])
    end
  end
end