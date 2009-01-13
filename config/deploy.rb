
require 'mongrel_cluster/recipes'

set :application, "concept-tracker"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/var/www/#{application}"
set :mongrel_conf, "#{current_path}/config/mongrel_cluster.yml"

set :repository,  "git@github.com:ThePiedPipes/concept-tracker.git"
#set :repository,  "#{current_path}/.git"
set :scm, :git
set :branch, "master"
set :deploy_via, :remote_cache
set :scm_command, "~/bin/git"

set :user, 'root'
set :passwd, ''
#set :admin_runner, 'root'

#role :app, "75.101.188.236"
#role :web, "75.101.188.236"
#role :db,  "75.101.188.236", :primary => true
default_run_options[:pty] = true

# NOTE: for some reason Capistrano requires you to have both the public and
# the private key in the same folder, the public key should have the 
# extension ".pub".


# Mahadev this is the important line. need to unpack the PEM into a folder in the .ssh dir
ssh_options[:keys] = ["#{ENV['HOME']}/.ssh/concept-tracker-key/concept-tracker-key"]

# Your EC2 instances. Use the ec2-xxx....amazonaws.com hostname, not
# any other name (in case you have your own DNS alias) or it won't
# be able to resolve to the internal IP address.
role :web,      "ec2-75-101-188-236.compute-1.amazonaws.com"
role :app,      "ec2-75-101-188-236.compute-1.amazonaws.com"
#role :memcache, "ec2-75-101-188-236.compute-1.amazonaws.com"
role :db,       "ec2-75-101-188-236.compute-1.amazonaws.com", :primary => true

# role :db,       "ec2-56-xx-xx-xx.z-1.compute-1.amazonaws.com", :primary => true, :ebs_vol_id => 'vol-12345abc'
# optinally, you can specify Amazon's EBS volume ID if the database is persisted 
# via Amazon's EBS.  See the main README for more information.

# Whatever you set here will be taken set as the default RAILS_ENV value
# on the server. Your app and your hourly/daily/weekly/monthly scripts
# will run with RAILS_ENV set to this value.
set :rails_env, "production"



