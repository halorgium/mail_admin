require 'lib/recipes/all'

depend :remote, :gem, "haml", ">=1.7.2"

set :rails_version, :edge
set :application, "mail_admin"
set :repository,  "git://git.zodal.net/tim/mail_admin.git"
set :scm, :git
set :git_enable_submodules, true

set :deploy_via, :remote_cache
set :deploy_configs, %w(database)

set :use_sudo, false
