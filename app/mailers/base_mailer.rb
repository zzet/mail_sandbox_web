class BaseMailer < ActionMailer::Base
  default :from => MailSandboxWeb.config.emails.sender_email
  default_url_options[:host] = MailSandboxWeb.config.host

  #def url_options
    #super.merge(:locale => (I18n.locale == I18n.default_locale ? nil : I18n.locale))
  #end
end
