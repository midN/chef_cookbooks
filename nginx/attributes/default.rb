os = node['platform']
osname = node['lsb']['codename']

default['nginx']['version'] = 'mainline'
default['nginx']['mainline_url'] = "http://nginx.org/packages/mainline/#{os}/"
default['nginx']['stable_url'] = "http://nginx.org/packages/#{os}/"
