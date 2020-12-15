require 'rails_helper'

RSpec.describe LoadMailer, type: :mailer do
  let(:customer) { FactoryBot.create(:customer) }
  let(:vendor_address) { FactoryBot.create(:address) }
  let(:vendor) { FactoryBot.create(:vendor, address: vendor_address) }
  let(:load) { FactoryBot.create(:load, customer: customer, vendor: vendor) }

  LoadMailer.class_eval do
    default from: 'test@example.com'
  end

  describe '#carrier_confirmation' do
    let(:email) { LoadMailer.carrier_confirmation(load.id, 'abc@gmail.com') }

    it 'renders the headers' do
      expect(email.subject).to eq("Isher Transport Load Confirmation - #{load.id}")
      expect(email.to).to eq(['abc@gmail.com'])
      expect(email.from).to eq(['test@example.com'])
    end

    it 'renders the body' do
      expect(email.body.encoded).to match(/Load Confirmation/)
    end

    it 'has pdf attachment' do
      expect(email.attachments.size).to eq(1)
      attachment = email.attachments.first
      expect(attachment).to be_kind_of(Mail::Part)
      expect(attachment.filename).to eq("isher-load-confirmation-#{load.id}.pdf")
      expect(attachment.content_type).to start_with('application/pdf')
    end
  end
end
