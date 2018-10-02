require 'rails_helper'

RSpec.describe Admin::CompaniesController, type: :controller do
  let(:company) { FactoryBot.create(:company) }
  let!(:companies) { FactoryBot.create_list(:company, 5) }

  before { sign_in_admin_user }

  describe "GET #index" do
    before { get :index }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'returns the collection of companies' do
      expect(assigns(:companies)).to eq Company.all.order(:name)
    end
  end

  describe "GET #show" do
    before { get :show, params: { id: company.id } }

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
    before { get :edit, params: { id: company.id } }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'renders the edit template' do
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST #create' do
    let(:company_attr) { FactoryBot.attributes_for(:company) }
    let(:post_request) {
      post :create, params: { company: company_attr }
    }
    # before { post_request }

    it 'create the new company' do
      expect { post_request }.to change(Company, :count).by(1)
    end

    it 'redirect after company is created' do
      post_request
      expect(response).to redirect_to([:admin, Company.last])
    end
  end

  describe 'PUT #update' do
    before do
      put :update, params: { id: company.id, company: { name: 'Samuel' } }
    end

    it 'updates the record' do
      company.reload
      expect(company.name).to eq('Samuel')
    end

    it 'redirect to company after update' do
      expect(response).to redirect_to(admin_company_path(company))
    end
  end
end
