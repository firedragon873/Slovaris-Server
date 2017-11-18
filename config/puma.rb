require 'dotenv'
Dotenv.load

threads_count = ENV["RAILS_MAX_THREADS"]
threads threads_count, threads_count

port        ENV["PORT"]
workers     ENV["WEB_CONCURRENCY"]
environment "development"

cwd = File.dirname(__FILE__) + '/..'

directory cwd
rackup "#{cwd}/config.ru"

pidfile "#{cwd}/tmp/pids/puma.pid"

# bind "tcp://0.0.0.0:#{ENV["PORT"]}"
bind "unix://#{cwd}/tmp/sockets/slovaris_puma.sock"

daemonize false
on_worker_boot do
    # ActiveSupport.on_load(:active_record) do
    #     ActiveRecord::Base.establish_connection
    # end
end
