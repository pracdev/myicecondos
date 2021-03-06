server "69.28.82.102", :web, :app, :db, primary: true

set :rails_env, "production"
set :unicorn_user, "#{user}"
set :unicorn_pid, "#{current_path}/tmp/pids/unicorn.pid"
set :unicorn_config, "#{shared_path}/config/unicorn_production.rb"
set :unicorn_log, "#{shared_path}/log/unicorn.log"
set :unicorn_workers, 4
