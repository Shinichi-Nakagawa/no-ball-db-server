#
# Cookbook Name:: sean_lahman
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

database_config = Chef::EncryptedDataBagItem.load('database_config', 'default')

# データとPythonスクリプトをコピー
for dir in node['sean_lahman']['dirs'] 
  remote_directory "#{node['home']}/#{dir}" do
	source dir
  	owner "vagrant"
  	group "vagrant"
  end
end

# database_config.pyを生成
template "#{node['home']}/script/database_config.py" do
  source 'database_config.py.erb'
  owner "vagrant"
  group "vagrant"
  variables(
    {
      :user => database_config['users']['app']['name'],
      :password => database_config['users']['app']['password'],
      :host => database_config['host'],
      :port => database_config['port'],
      :database => database_config['name'],
    }
  )
end

# データ格納先Directoryを削除&作成
directory node['sean_lahman']['directory'] do
  action :delete
end

directory node['sean_lahman']['directory'] do
  owner "vagrant"
  group "vagrant"
  mode 00755
  action :create
end

# zipを解凍
execute node['sean_lahman']['archive'] do
  command "unzip #{node['home']}/data/#{node['sean_lahman']['archive']} -d #{node['sean_lahman']['directory']}"
end

# データ生成スクリプトを実行
bash node['sean_lahman']['create_database'] do
  user "vagrant"
  group "vagrant"
  cwd "#{node['home']}"
  code "python #{node['sean_lahman']['create_database']}"
  environment "PYTHONPATH" => node['home']
end
