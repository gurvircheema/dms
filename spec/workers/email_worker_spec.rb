require 'rails_helper'
require 'sidekiq/testing'
Sidekiq::Testing.fake!

RSpec.describe EmailWorker, type: :worker do
  describe 'enqueues a worker' do
    let(:args) { { load_id: 1, email: 'test@gmail.com' } }

    it 'changes the queue count' do
      expect {
        EmailWorker.perform_async('carrier_confirmation', args)
      }.to change(EmailWorker.jobs, :size).by(1)
    end

  end
end
