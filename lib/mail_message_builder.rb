class MailMessageBuilder

  def self.build(params)

    mail = Mail.new(params[:data])
    new_params = {
      :data => params[:data],
      :recipient => params[:recipient],
      :sender => params[:sender],
      :completed_at => params[:completed_at],
      :subject => mail.subject
    }

    MailMessage.new(new_params)

  end

end
