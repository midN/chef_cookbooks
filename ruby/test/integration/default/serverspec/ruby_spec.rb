require 'serverspec'

# Required by serverspec
set :backend, :exec

describe 'Ruby and Rubygems are installed' do
  describe 'Ruby has proper version' do
    describe command('ruby -v') do
      its(:stdout) { should match /ruby 2\.3\.0.*/ }
    end
  end

  describe 'Rubygems has proper version' do
    describe command('gem -v') do
      its(:stdout) { should match /2\.6\.4/ }
    end
  end
end
