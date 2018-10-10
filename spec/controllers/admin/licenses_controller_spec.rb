require 'rails_helper'

RSpec.describe Admin::LicensesController, type: :controller do
  let(:user) { FactoryBot.create(:user, admin: true) }
  let(:driver) { FactoryBot.create(:driver) }
  let(:license) { FactoryBot.create(:license, driver: driver) }
  let(:valid_attr) { FactoryBot.attributes_for(:license) }

  before do
    sign_in user
  end

  describe 'POST :create' do
    let(:post_req) { post :create, params: { driver_id: driver.id, license: valid_attr } }

    it 'creates a license record' do
      expect{ post_req }.to change(License, :count).by(1)
    end
  end

  describe 'GET :show' do
    before { get :show, params: { driver_id: driver.id, id: license.id } }

    it 'return the license record' do
      expect(assigns(:license)).to eq(license)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'returns the 200 status code' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'PUT :update' do
    before { put :update, params: { driver_id: driver.id, id: license.id, license: { number: '123456' } } }

    it 'updates the record' do
      license.reload
      expect(license.number).to eq('123456')
    end

    it 'redirect to driver path after update' do
      expect(response).to redirect_to([:admin, driver])
    end
  end
end
