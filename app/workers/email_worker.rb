class EmailWorker
  include Sidekiq::Worker

  ALLOWED_EMAIL_TYPES = [
    'carrier_confirmation'
  ].freeze

  def perform(email_type, args = {})
    return unless ALLOWED_EMAIL_TYPES.include?(email_type.to_s)

    send("#{email_type}_email", args)
  end

  private

  def carrier_confirmation_email(options = {})
    load_id = options.fetch('load_id')
    email = options.fetch('email')

    LoadMailer.carrier_confirmation(load_id, email).deliver_later
  end
end
