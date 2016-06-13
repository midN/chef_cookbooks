name  'railsapp'
maintainer  'Andres Ivanov'
maintainer_email  'andres@andres.wtf'
description 'Deploys rails app'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1'

depends 'base'
depends 'ruby'
depends 'application'
depends 'application_ruby'
depends 'postgresql'
depends 'nginx'
