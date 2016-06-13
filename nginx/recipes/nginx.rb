# Set nginx_url depending on version selected in attributes.
case node['nginx']['version']
when 'mainline'
  nginx_url = node['nginx']['mainline_url']
when 'stable'
  nginx_url = node['nginx']['stable_url']
end

# Copy nginx_signing.key from nginx url
remote_file '/opt/nginx_signing.key' do
  source 'http://nginx.org/keys/nginx_signing.key'
end

# Add nginx signing key to apt and create customer resource list
execute 'add nginx key file to apt' do
  command 'apt-key add /opt/nginx_signing.key'
end

file '/etc/apt/sources.list.d/nginx.list' do
  content <<-EOF
deb #{nginx_url} #{node['lsb']['codename']} nginx
deb-src #{nginx_url} #{node['lsb']['codename']} nginx
EOF
end

execute 'apt update' do
  command 'apt-get update'
end

package 'nginx'
