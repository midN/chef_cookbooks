require 'serverspec'

# Required by serverspec
set :backend, :exec

describe 'Nginx is installed and running' do
  describe package('nginx') do
    it { should be_installed }
  end

  describe service('nginx') do
    it { should be_running }
  end
end
