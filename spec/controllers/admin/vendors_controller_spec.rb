require 'rails_helper'

RSpec.describe Admin::VendorsController, type: :controller do
  let(:vendor) { FactoryBot.create(:vendor) }
  let!(:vendor_list) { FactoryBot.create_list(:vendor, 5) }

  before { sign_in_admin_user }

  describe 'GET #index' do
    before { get :index }

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'return collection of all vendors' do
      expect(assigns(:vendors).length).to eq(5)
    end

    it 'returns the 200 status code' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    let(:post_request) do
      post :create, params: { vendor: FactoryBot.attributes_for(:vendor) }
    end

    it 'creates a new vendor' do
      expect { post_request }.to change(Vendor, :count).by(1)
    end

    it 'redirects to new vendor' do
      post_request
      expect(response).to have_http_status(302)
    end
  end

  describe 'PUT #update' do
    before do
      put :update, params: { id: vendor.id, vendor: { internal_name: 'ABC' } }
    end

    it 'updates the vendor' do
      expect(assigns(:vendor).internal_name).to eq('ABC')
    end
  end

  describe 'DELETE #destroy' do
    before { delete :destroy, params: { id: vendor.id } }

    it 'marks the record as deleted' do
      vendor.reload
      expect(vendor.deleted_at).not_to eq(nil)
    end
  end
end
