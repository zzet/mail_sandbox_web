namespace :sandbox do

  desc "Start mail sandbox"
  task :start => [:start_web, :start_smtp] do
  end

  desc "Stop mail sandbox"
  task :stop => [:stop_web, :stop_smtp] do
  end

  desc "Restart mail sandbox"
  task :restart => [:stop, :start] do
  end

  desc "Start mail sandbox web interface"
  task :start_web do
    #file = File.join("config/unicorn", "#{Rails.env}.rb")
    file = "config/unicorn.rb"
    spawn "cd #{Rails.root}; RAILS_ENV=#{Rails.env} bundle exec unicorn_rails -c #{file}"
  end

  desc "Start mail sandbox smtp serve"
  task :start_smtp do
    spawn "cd #{Rails.root}; RAILS_ENV=#{Rails.env} bundle exec mail_sandbox -c config/mail_sandbox.yml"
  end

  desc "Stop mail sandbox web interface"
  task :stop_web do
    file = File.join(Rails.root, "tmp/pids/unicorn.pid")
    begin
      Process.kill "QUIT", File.read(file).to_i if File.exists?(file)
    rescue Errno::ESRCH
      #  Ignore
    end
  end

  desc "Stop mail sandbox smtp interface"
  task :stop_smtp do
    file = File.join(Rails.root, "tmp/pids/mail_sandbox.pid")
    begin
      Process.kill "QUIT", File.read(file).to_i if File.exists?(file)
    rescue Errno::ESRCH
      #  Ignore
    end
  end

end
