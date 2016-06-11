require 'serverspec'

# Required by serverspec
set :backend, :exec

describe 'Base recipe works' do
  describe 'Dependencies are installed' do
    [
      'fail2ban', 'unattended-upgrades', 'libpq-dev', 'nodejs', 'htop', 'git',
      'build-essential', 'automake', 'bison', 'autoconf', 'curl', 'openssl',
      'libssl-dev', 'libreadline6', 'libreadline6-dev', 'zlib1g', 'zlib1g-dev',
      'libyaml-dev', 'libxml2-dev', 'libc6-dev', 'libtool'
    ].each do |p|
      describe package(p) do
        it { should be_installed }
      end
    end
  end

  describe 'Automatic updates and ntpdate files exist' do
    describe file('/etc/apt/apt.conf.d/10periodic') do
      it { should exist }
    end

    describe file('/etc/cron.daily/ntpdate') do
      it { should exist }
    end
  end
end
