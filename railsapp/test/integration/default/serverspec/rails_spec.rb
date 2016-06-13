require 'serverspec'

# Required by serverspec
set :backend, :exec

describe 'Make sure app is up and running' do
  describe service('unicorn') do
    it { should be_running }
  end

  describe port('8080') do
    it { should be_listening }
  end
end
