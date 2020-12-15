require 'rails_helper'

RSpec.describe Admin::CompaniesController, type: :controller do
  let(:address) { FactoryBot.create(:address) }
  let(:company) { FactoryBot.create(:company, address: address) }

  before { sign_in_admin_user }

  describe '#show' do
    before { get :show, params: { id: company.id } }

    it 'renders show template' do
      expect(response).to render_template(:show)
    end

    it 'fetches the company' do
      expect(assigns(:company).id).to eq(company.id)
    end
  end

  describe '#edit' do
    before { get :edit, params: { id: company.id } }

    it 'renders the edit template' do
      expect(response).to render_template(:edit)
    end
  end

  describe '#update' do
    before { put :update, params: { id: company.id, company: { name: 'New Name', contact: 'New Contact' } } }

    it 'updates the company' do
      company.reload
      expect(company.name).to eq('New Name')
      expect(company.contact).to eq('New Contact')
    end
  end
end
