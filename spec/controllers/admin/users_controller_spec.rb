require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let!(:list) { FactoryBot.create_list(:user, 5) }

  before { sign_in_admin_user }

  describe '#index' do
    before { get :index }

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'fetches the users' do
      expect(assigns(:users).length).to eq(6)
    end
  end

  describe '#new' do
    before { get :new }

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end
  end

  describe '#edit' do
    before { get :edit, params: { id: user.id } }

    it 'renders the edit template' do
      expect(response).to render_template(:edit)
    end
  end

  describe '#create' do
    let(:post_req) {
      post :create, params: { user: attributes_for(:user) }
    }

    it 'creates a new user' do
      expect { post_req }.to change(User, :count).by(1)
    end
  end

  describe '#update' do
    before { put :update, params: { id: user.id, user: { name: 'Example' } }}

    it 'updates the user and redirect to user index' do
      user.reload
      expect(user.name).to eq('Example')
      expect(response).to redirect_to([:admin, :users])
    end
  end

  describe '#destroy' do
    before { delete :destroy, params: { id: user.id } }

    it 'marks the user as deleted' do
      user.reload
      expect(user.deleted_at).not_to eq(nil)
    end
  end
end
