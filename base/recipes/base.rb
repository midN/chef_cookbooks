# Install dependency packages
include_recipe 'base::dependency'

# Ubunt 14.04 disabled /etc/init.d/ssh restart, so need to use service command instead.
service 'ssh' do
  start_command "service ssh start"
  stop_command "service ssh stop"
  restart_command "service ssh restart"
end

# Permit root login, passwordless login is disabled by default
ruby_block "Permit root ssh login" do
  block do
    sshd = Chef::Util::FileEdit.new('/etc/ssh/sshd_config')
    sshd.search_file_replace_line(/^PermitRootLogin/, "PermitRootLogin no")
    sshd.write_file
  end
  notifies :restart, 'service[ssh]'
end

# Install security-updates automatically every day
file '/etc/apt/apt.conf.d/10periodic' do
  owner 'root'
  group 'root'
  mode '0644'
  content <<-EOF
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Download-Upgradeable-Packages "1";
APT::Periodic::AutocleanInterval "7";
APT::Periodic::Unattended-Upgrade "1";
  EOF
end

# Automatic time updates
file '/etc/cron.daily/ntpdate' do
  owner 'root'
  group 'root'
  mode '0755'
  content <<-EOF
!/bin/sh
ntpdate -s ntp.ubuntu.com pool.ntp.org
  EOF
end
