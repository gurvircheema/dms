require 'rails_helper'

RSpec.describe Admin::LoadConfirmationsController, type: :controller do
  let(:customer) { FactoryBot.create(:customer) }
  let(:load) { FactoryBot.create(:load, customer: customer) }

  before { sign_in_admin_user }

  describe '#show' do
    context 'html format' do
      before { get :show, params: { id: load.id } }

      it 'renders the show template' do
        expect(response).to render_template(:show)
      end
    end

    context 'pdf format' do
      before { get :show, params: { id: load.id }, format: :pdf }

      it 'renders the show pdf template' do
        expect(response).to render_template(:show)
        expect(response.content_type).to eq('application/pdf')
      end
    end
  end
end