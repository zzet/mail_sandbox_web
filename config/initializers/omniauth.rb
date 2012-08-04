Rails.application.config.middleware.use OmniAuth::Builder do

  configure do |c|
    c.path_prefix = MailSandboxWeb.config.omniauth.path_prefix
  end

  provider :facebook, MailSandboxWeb.config.auth_providers.facebook.app_id,
                      MailSandboxWeb.config.auth_providers.facebook.app_secret

  provider :github, MailSandboxWeb.config.auth_providers.github.app_id,
                    MailSandboxWeb.config.auth_providers.github.app_secret,
                    scope: "public, user:email"
end
