require 'rails_helper'

RSpec.describe Admin::PermitsController, type: :controller do
  let(:equipment) { FactoryBot.create(:equipment) }
  let(:permit) { FactoryBot.create(:permit, equipment: equipment) }
  before { sign_in_admin_user }

  describe 'GET #new' do
    before { get :new, params: { equipment_id: equipment.id } }

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #edit' do
    before { get :edit, params: { equipment_id: equipment.id, id: permit.id } }

    it 'renders the edit template' do
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST #create' do
    let(:post_request) do
      post :create, params: {
        equipment_id: equipment.id,
        permit: FactoryBot.attributes_for(:permit)
      }
    end

    it 'creates the permit' do
      expect { post_request }.to change(Permit, :count).by(1)
    end

    it 'redirects to equipment after creation' do
      post_request
      expect(response).to redirect_to([:admin, equipment])
    end
  end

  describe 'PUT #update' do
    before do
      put :update,
        params: {
        equipment_id: equipment.id, id: permit.id,
        permit: { permit_number: 'ABC123' } }
    end

    it 'updates the record' do
      permit.reload
      expect(permit.permit_number).to eq('ABC123')
    end
  end

  describe 'DELETE #destroy' do
    before {
      delete :destroy, params: { equipment_id: equipment.id, id: permit.id }
    }

    it 'marks the deleted_at for given record' do
      permit.reload
      expect(permit.deleted_at).to_not eq(nil)
    end
  end
end
