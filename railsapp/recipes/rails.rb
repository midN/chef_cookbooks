include_recipe 'base::base'
include_recipe 'ruby::ruby'
include_recipe 'postgresql::server'
include_recipe 'nginx::nginx'

service 'nginx' do
  action :nothing
end

gem_package 'bundler' do
  options '--no-ri --no-rdoc'
end

group 'deploy'
user 'deploy' do
  shell '/bin/bash'
  home '/home/deploy'
  gid 'deploy'
end

directory '/opt/webapps' do
  owner 'deploy'
  group 'deploy'
end

postgresql_user "rails5app" do
  superuser true
  createdb true
  login true
  password "thisisnotthebestpasswordintheworldthisisjustatribute"
end

postgresql_database "rails5app" do
  owner "rails5app"
  encoding "UTF-8"
  template "template0"
  locale "en_US.UTF-8"
end

application '/opt/webapps/suchwowapp' do
  git do
    repository 'https://github.com/midN/rails5app.git'
  end
  bundle_install
  rails do
    rails_env 'production'
    migrate true
    precompile_assets true
    secret_token 'wow'
    database do
      adapter 'postgresql'
      database 'rails5app'
      user 'rails5app'
      password 'thisisnotthebestpasswordintheworldthisisjustatribute'
    end
  end
  unicorn do
    port 8080
  end
end

# Change default conf file
cookbook_file 'nginx.conf' do
  path '/etc/nginx/conf.d/default.conf'
  source 'nginx.conf.erb'
  notifies :restart, 'service[nginx]', :immediately
end
