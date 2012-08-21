class MailApplicationDecorator < Draper::Base
  decorates :mail_application
  include Draper::LazyHelpers

  def mail_application_settings
    settings = [
      "config.action_mailer.smtp_settings = {",
      ":address => '#{mail_application.address}',",
      ":port => #{mail_application.port},",
      ":user_name => '#{mail_application}',",
      ":password => '#{mail_application.password}'",
      "}"
    ]

    settings.map { |str| content_tag :span, str }.join('<br/>')
  end

  def to_s
    mail_application
  end

end
