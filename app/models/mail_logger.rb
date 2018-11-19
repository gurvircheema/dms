class MailLogger
  def self.log(message=nil)
    return unless message.present?

    @logger ||= Logger.new(File.join(Rails.root, 'log', 'mail.log'))
    @logger.debug(message)
  end
end