include_recipe 'apt'

[
  'fail2ban', 'unattended-upgrades', 'libpq-dev', 'nodejs', 'htop', 'git',
  'build-essential', 'automake', 'bison', 'autoconf', 'curl', 'openssl',
  'libssl-dev', 'libreadline6', 'libreadline6-dev', 'zlib1g', 'zlib1g-dev',
  'libyaml-dev', 'libxml2-dev', 'libc6-dev', 'libtool'
].each do |p|
  package p
end
