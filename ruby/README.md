# ruby cookbook

## Recipes
  * **ruby**
    * Installs specific ruby version from source
  * **rubygems**
    * Installs specific rubygems version from source

## Attributes
  * `node['ruby']['version']` - Custom version of ruby, full version with patch, default: "2.3.0"
  * `node['rubygems']['version']` - Rubygems version to install, default "2.6.4"
  * `node['rubygems']['setup_command']` - Full command to run setup.rb from source, appends --no-rdocs --no-ri etc. Modify if required
