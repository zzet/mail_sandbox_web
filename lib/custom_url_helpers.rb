module CustomUrlHelpers

  def self.faye_curl
    "#{MailSandboxWeb.config.host}:#{MailSandboxWeb.config.faye.port}#{MailSandboxWeb.config.faye.url}"
  end

  def self.faye_js_curl
    "#{faye_curl}/client.js"
  end

  def self.faye_message_new_channel_cpath
    "/message/new"
  end

end
