Kaminari.configure do |config|
  config.default_per_page = MailSandboxWeb.config.pagination.default_per_page
end
