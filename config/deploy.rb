
require 'mongrel_cluster/recipes'

set :application, "concept-tracker"
set :repository,  "git@github.com:ThePiedPipes/concept-tracker.git"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/var/www/#{application}"
set :mongrel_conf, "#{current_path}/config/mongrel_cluster.yml"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git
set :branch, "master"

role :app, "75.101.188.236"
role :web, "75.101.188.236"
role :db,  "75.101.188.236", :primary => true