#
# Cookbook:: gsmartcontrol
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'gsmartcontrol::default' do
  platforms = {
    'centos' => {
      'versions' => ['7.3.1611']
      }
    }
  platforms.keys.each do |platform|
    platforms[platform]['versions'].each do |version|
    context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: platform, version: version)
      runner.converge(described_recipe)
    end

    it 'creates alex repo with proper info' do
      expect(chef_run).to create_yum_repository('alex').with(baseurl: 'http://download.opensuse.org/repositories/home:/alex_sh/CentOS_7/')
      expect(chef_run).to create_yum_repository('alex').with(gpgcheck: true)
      expect(chef_run).to create_yum_repository('alex').with(gpgkey: 'http://download.opensuse.org/repositories/home:/alex_sh/CentOS_7/repodata/repomd.xml.key')
      expect(chef_run).to create_yum_repository('alex').with(enabled: true)
    end

    it 'installs gsmartcontrol package' do
      expect(chef_run).to install_package('gsmartcontrol')
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
 end
end
end

