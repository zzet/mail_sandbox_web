# coding: UTF-8
# Rails.root are not defined now.
app_path = File.expand_path('../../', __FILE__)
shared_path = File.expand_path('../../../../shared', __FILE__)

secret_keys_path = "#{shared_path}/configs/secret_keys.yml"
unless File.exist?(secret_keys_path)
  puts "WARNING: no secret keys file. You try to load: '#{secret_keys_path}'"
  # load sample file if not exist for 'rake sandbox:setup'
  secret_keys_path = "#{app_path}/config/secret_keys.sample.yml"
end

mail_sandbox_server_config_path = "#{app_path}/config/mail_sandbox.yml"
unless File.exist?(mail_sandbox_server_config_path)
  puts "WARNING: no mail_sandbox server config file. You try to load: '#{mail_sandbox_server_config_path}'"
  # load sample file if not exist for 'rake sandbox:setup'
  mail_sandbox_server_config_path = "#{app_path}/config/mail_sandbox.sample.yml"
end

Persey.init Rails.env do
  source :yaml, secret_keys_path, :secret_keys
  source :yaml, mail_sandbox_server_config_path, :smtp_config

  env :production do
    domain "mail-sandbox-web.example.com"
    schema "http"

    host -> { "#{schema}://#{domain}" }

    faye do
      url '/faye'
      port 9292
    end

    airbrake do
      enable? -> { secret_keys.to_hash.has_key?(:airbrake) }
      api_key -> { secret_keys.airbrake.api_key }
      host    -> { secret_keys.airbrake.host }
    end

    omniauth do
      path_prefix '/user'
    end

    auth_providers do
      facebook do
        enable?     -> { secret_keys.to_hash.has_key?(:facebook) }
        app_id      -> { secret_keys.facebook.app_id }
        app_secret  -> { secret_keys.facebook.app_secret }
      end

      github do
        enable?     -> { secret_keys.to_hash.has_key?(:github) }
        app_id      -> { secret_keys.github.app_id }
        app_secret  -> { secret_keys.github.app_secret }
      end
    end

    mail_application do
      port -> { smtp_config.port }
    end

    pagination do
      default_per_page 10
      per_page_list [5,10,20,50,100]
    end

    emails do
      sender_email -> { "mailsandbox@#{domain}" }
    end
  end

  env :development, :parent => :production do
    domain "localhost"
    port 8080
  end

  env :test, :parent => :development do
    domain "localhost"
    port 8080
  end
end
