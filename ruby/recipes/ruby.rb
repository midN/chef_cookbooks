remote_file "/opt/ruby-#{node[:ruby][:version]}.tar.gz" do
  not_if "/usr/local/bin/ruby -v | grep #{node[:ruby][:version]}"
  source "http://cache.ruby-lang.org/pub/ruby/#{node[:ruby][:version][0..2]}/ruby-#{node[:ruby][:version]}.tar.gz"
  notifies :run, 'bash[install ruby]', :immediately
end

bash 'install ruby' do
  user 'root'
  cwd '/opt'
  code <<-EOH
    tar --no-same-owner -zxf ruby-#{node[:ruby][:version]}.tar.gz
    (cd ruby-#{node[:ruby][:version]}/ && ./configure && make && make install)
  EOH
  action :nothing
end

# Install rubygems
include_recipe "ruby::rubygems"
