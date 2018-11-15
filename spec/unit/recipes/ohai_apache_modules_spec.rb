#
# Cookbook:: apache
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'apache::ohai_apache_modules' do
  context 'When all attributes are default, on CentOS 6.9' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '6.9')
      runner.converge(described_recipe)
    end
    
    it 'installs the modules plugin' do 
      expect(chef_run).to create_ohai_plugin('apache_modules')
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
