require 'rails_helper'

RSpec.describe Admin::CustomersController, type: :controller do
  let(:customer) { FactoryBot.create(:customer) }
  let!(:customers) { FactoryBot.create_list(:customer, 5) }

  before { sign_in_admin_user }

  describe "GET #index" do
    before { get :index }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'returns the collection of companies' do
      expect(assigns(:customers)).to eq Customer.all.order(:name)
    end
  end

  describe "GET #show" do
    before { get :show, params: { id: customer.id } }

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    before { get :new}

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    before { get :edit, params: { id: customer.id } }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'renders the edit template' do
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST #create' do
    let(:customer_attr) { FactoryBot.attributes_for(:customer) }
    let(:post_request) {
      post :create, params: { customer: customer_attr }
    }

    it 'create the new customer' do
      expect { post_request }.to change(Customer, :count).by(1)
    end

    it 'redirect after customer is created' do
      post_request
      expect(response).to redirect_to([:admin, Customer.last])
    end
  end

  describe 'PUT #update' do
    before do
      put :update, params: { id: customer.id, customer: { name: 'Samuel' } }
    end

    it 'updates the record' do
      customer.reload
      expect(customer.name).to eq('Samuel')
    end

    it 'redirect to customer after update' do
      expect(response).to redirect_to(admin_customer_path(customer))
    end
  end
end
