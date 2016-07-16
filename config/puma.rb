workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_max = Integer(ENV['MAX_THREADS'] || 6)
threads_min = Integer(ENV['MIN_THREADS'] || 1)
threads threads_min, threads_max

preload_app!

app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{ app_dir }/shared"
rails_env = ENV['RACK_ENV'] || 'development'

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment rails_env

if rails_env == 'production'
  # Socket location
  bind "unix://#{ shared_dir }/sockets/puma.sock"

  # Logging
  stdout_redirect "#{ shared_dir }/log/puma.stdout.log", "#{ shared_dir }/log/puma.stderr.log", true
end

# Set master PID and state locations
pidfile "#{ shared_dir }/pids/puma.pid"
state_path "#{ shared_dir }/pids/puma.state"
activate_control_app
