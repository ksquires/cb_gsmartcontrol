#
# Cookbook:: gsmartcontrol
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#

yum_repository 'alex' do
  baseurl 'http://download.opensuse.org/repositories/home:/alex_sh/CentOS_7/'
  gpgcheck true
  enabled true
  gpgkey 'http://download.opensuse.org/repositories/home:/alex_sh/CentOS_7/repodata/repomd.xml.key'
  description 'repo for gsmartcontrol'
end

package 'gsmartcontrol'
