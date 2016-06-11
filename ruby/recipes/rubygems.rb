remote_file "/opt/rubygems-#{node[:rubygems][:version]}.tgz" do
  source "http://production.cf.rubygems.org/rubygems/rubygems-#{node[:rubygems][:version]}.tgz"
  not_if do
    ::File.exists?('/usr/local/bin/gem') && `/usr/local/bin/gem -v`.strip == node[:rubygems][:version]
  end
end

execute "tar xfz rubygems-#{node[:rubygems][:version]}.tgz" do
  cwd "/opt"
  umask 022
  only_if do
    ::File.exists?("/opt/rubygems-#{node[:rubygems][:version]}.tgz")
  end
end

execute "Updating Rubygems to #{node[:rubygems][:version]}" do
  command node[:rubygems][:setup_command]
  cwd "/opt/rubygems-#{node[:rubygems][:version]}"
  umask 022
  only_if do
    ::File.exists?("/opt/rubygems-#{node[:rubygems][:version]}")
  end
end

execute "Clean up" do
  command "rm -rf rubygems-#{node[:rubygems][:version]}*"
  cwd "/opt"
end

gem_package "bundler" do
  options "--no-user-install"
  action :install
end

execute "Change ownership of ruby" do
  command "chmod -R 777 /usr/local/lib/ruby/gems"
end

execute "Change right to execute bundler" do
  command "chmod 755 /usr/local/bin/bundle"
end
