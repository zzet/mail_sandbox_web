module ServiceLocator
  module Services
    def self.email_sender
      @email_sender ||= ::Services::EmailService.new
    end
  end

  def self.services
    Services
  end
end
