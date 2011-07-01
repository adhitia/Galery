set :application, "Galery"
set :repository,  "git://github.com/adhitia/Galery.git"

set :scm, :git

role :web, "adhitia-hidayat.co.cc"                          # Your HTTP server, Apache/etc
role :app, "adhitia-hidayat.co.cc"                          # This may be the same as your `Web` server
role :db,  "adhitia-hidayat.co.cc", :primary => true        # This is where Rails migrations will run
set :user, "root"
set :branch, "master"
set :deploy_via, :remote_cache
set :deploy_to, "/home/project/galery"
set :configs, %w{database.yml}


task :after_update_code do
  configs.each do |config|
    run "cp #{shared_path}/config/#{config} #{release_path}/config/#{config}"
  end
  
  #run "ln -s #{shared_path}/system/uploads #{release_path}/public/uploads"

  #run "chmod 777 #{current_path}/tmp -R"
end



 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end
