require 'rails_helper'

RSpec.describe Admin::ViolationTicketsController, type: :controller do
  let(:user) { FactoryBot.create(:user, is_admin: true) }
  let(:driver) { FactoryBot.create(:driver) }
  let(:violation_ticket) { FactoryBot.create(:violation_ticket, driver: driver) }

  before do
    sign_in user
  end

  describe '#new' do
    before { get :new, params: { driver_id: driver.id } }
    it 'renders the new template' do
      expect(response).to render_template(:new)
    end
    it 'returns the 200 status code' do
      expect(response).to have_http_status(200)
    end
  end

  describe '#create' do
    let(:post_request) do
      post :create, params: {
        driver_id: driver.id,
        violation_ticket: FactoryBot.attributes_for(:violation_ticket)
      }
    end

    it 'creates the violation ticket' do
      expect { post_request }.to change(ViolationTicket, :count).by(1)
    end

    it 'redirects to driver page' do
      post_request
      expect(response).to redirect_to(admin_driver_path(driver))
    end
  end

  describe '#update' do
    before do
      put :update, params: { id: violation_ticket.id, driver_id: driver.id, violation_ticket: { description: 'Speeding' } }
    end

    it 'updates the violation ticket' do
      violation_ticket.reload
      expect(violation_ticket.description).to eq('Speeding')
    end

    it 'redirects to driver page' do
      expect(response).to redirect_to([:admin, driver])
    end
  end
end
