require 'rails_helper'

RSpec.describe Admin::LoadsController, type: :controller do
  let(:customer) { FactoryBot.create(:customer) }
  let(:load) { FactoryBot.create(:load, customer: customer) }
  let!(:load_list) { FactoryBot.create_list(:load, 5, customer: customer) }

  before { sign_in_admin_user }

  describe 'GET #index' do
    before { get :index }

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'fetches the loads' do
      expect(assigns(:loads).length).to eq 5
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end

    it 'returns the 200 status code' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: load.id } }

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'assigns the load' do
      expect(assigns(:load)[:customer_ref_number]).to eq 'LCA12346'
    end
  end

  describe 'POST #create' do
    let(:load_attr) { FactoryBot.attributes_for(:load, customer_id: customer.id) }
    let(:post_request) { post :create, params: { load: load_attr } }

    it 'creates the load' do
      expect { post_request }.to change(Load, :count).by(1)
    end

    it 'redirects to load' do
      post_request
      load = Load.last
      expect(response).to redirect_to([:admin, load])
    end
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: load.id, load: { customer_ref_number: 'NEW123' } } }

    it 'renders the edit template' do
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT #update' do
    before { put :update, params: { id: load.id, load: { customer_ref_number: 'NEW123' } } }

    it 'updates the load' do
      load.reload
      expect(load.customer_ref_number).to eq('NEW123')
    end
  end
end
