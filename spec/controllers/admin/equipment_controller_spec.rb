require 'rails_helper'

RSpec.describe Admin::EquipmentController, type: :controller do
  let(:equipment) { FactoryBot.create(:equipment) }
  let!(:equipment_list) { FactoryBot.create_list(:equipment, 5) }
  before { sign_in_admin_user }

  describe 'GET #index' do
    before { get :index }

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'fetches equipments' do
      expect(assigns(:equipment).length).to eq(5)
    end
  end

  describe 'GET #new' do
    before { get :new, as: :html }

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: equipment.id} }

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'assigns the proper record' do
      expect(assigns(:equipment)).to eq(equipment)
    end

    it 'returns the 200 status code' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    let(:post_request) do
      post :create, params: { equipment: FactoryBot.attributes_for(:equipment) }
    end

    it 'creates the record' do
      expect { post_request }.to change(Equipment, :count).by(1)
    end
  end

  describe 'PUT #update' do
    before { put :update, params: { id: equipment.id, equipment: { unit_number: '101' } } }

    it 'updates the record' do
      equipment.reload
      expect(equipment.unit_number).to eq('101')
    end
  end
end
