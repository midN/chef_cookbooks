# Ruby
default['ruby']['version'] = '2.3.0'

# Rubygems
default['rubygems']['version'] = '2.6.4'
default['rubygems']['setup_command'] = "/usr/bin/env LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 /usr/local/bin/ruby --disable-gems setup.rb --no-rdoc --no-ri"
