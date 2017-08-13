describe yum.repo('alex') do
  it { should exist }
  it { should be_enabled }
end

describe file('/etc/yum.repos.d/alex.repo') do
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe package('gsmartcontrol') do
  it { should be_installed }
end

