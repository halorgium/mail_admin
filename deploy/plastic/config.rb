set :primary_host, "plastic.spork.in"

set :mongrel_port, 18000
set :mongrel_servers, 2
set :mongrel_user, "deploy"
set :mongrel_group, "nogroup"

role :web, primary_host
role :app, primary_host
role :db,  primary_host, :primary => true

set :user, "deploy"
set :deploy_to, "/home/deploy/#{application}"
