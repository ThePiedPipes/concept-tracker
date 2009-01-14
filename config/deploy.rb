
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
#set :scm_command, "~/bin/git"

#set :repository, "."
#set :scm, :none
#set :deploy_via, :copy

set :user, 'root'
#set :passwd, ''
#set :user, 'andyruby'
#set :admin_runner, 'root'

# means that I can check out through github with same keypair
set :ssh_options, { :forward_agent => true }

#role :app, "75.101.188.236"
#role :web, "75.101.188.236"
#role :db,  "75.101.188.236", :primary => true
default_run_options[:pty] = true


# this is no longer important now that we've got the rsa keypairs lined up
#ssh_options[:keys] = [""]

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

set :rails_env, "production"

after "deploy:update_code" do
  run "ln -nfs #{File.join(shared_path, 'config', '*')} #{File.join(release_path, 'config')}"
end

desc "tail production log files" 
task :tail_logs, :roles => :app do
  run "tail -f #{shared_path}/log/production.log" do |channel, stream, data|
    puts  # for an extra line break before the host name
    puts "#{channel[:host]}: #{data}" 
    break if stream == :err    
  end
end