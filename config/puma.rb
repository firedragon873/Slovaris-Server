# pidfile "/var/www/admin/current/shared/tmp/pids/puma.pid"
# stdout_redirect "/var/www/admin/current/shared/tmp/log/stdout", "/var/www/admin/current/shared/tmp/log/stderr"
# threads 2, 16
# workers 2
# bind "unix:///var/www/admin/current/shared/tmp/sockets/puma.sock"
# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum, this matches the default thread size of Active Record.
#
require 'dotenv'
Dotenv.load

threads_count = ENV["RAILS_MAX_THREADS"]
threads threads_count, threads_count

port        ENV["PORT"]
workers     ENV["WEB_CONCURRENCY"]
environment ENV["RAILS_ENV"]

cwd = File.dirname(__FILE__) + '/..'

directory cwd
rackup "#{cwd}/config.ru"

pidfile "#{cwd}/tmp/pids/puma.pid"

# bind "tcp://0.0.0.0:#{ENV["PORT"]}"
bind "unix://#{cwd}/tmp/sockets/slovaris_puma.sock"

on_worker_boot do
    # ActiveSupport.on_load(:active_record) do
    #     ActiveRecord::Base.establish_connection
    # end
end
