#
# Cookbook Name:: migrate
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'database::mysql'

database_config = Chef::EncryptedDataBagItem.load('database_config', 'default')

mysql_connection_info = {
  :host => database_config['host'],
  :username => database_config['users']['root']['name'],
  :password => database_config['users']['root']['password']
}


# create database
mysql_database database_config['name'] do
  connection mysql_connection_info
  action :create
end


# create & grant admin username
mysql_database_user database_config['users']['admin']['name'] do
  connection mysql_connection_info
  password database_config['users']['admin']['password']
  database_name database_config['name']
  privileges [:all]
  action [:create, :grant]
end


# create & grant application user
mysql_database_user database_config['users']['app']['name'] do
  connection mysql_connection_info
  password database_config['users']['app']['password']
  database_name database_config['name']
  privileges [:select, :update, :insert, :delete]
  host '%'  # TODO 開発用。本番ではHOSTを絞ろう
  action [:create, :grant]
end

for query in node['database']['sean_lahman']['sql'] do
  cookbook_file query do
    path "/tmp/#{query}"
    action :create_if_missing
  end
  execute query do
    command "mysql -u#{database_config['users']['admin']['name']} -D#{database_config['name']} -p#{database_config['users']['admin']['password']} < /tmp/#{query}"
  end

end


# generate SQLAlchemy model code
execute node['database']['sean_lahman']['python'] do
  command "sqlacodegen mysql://#{database_config['users']['admin']['name']}:#{database_config['users']['admin']['password']}@#{database_config['host']}:#{database_config['port']}/#{database_config['name']} --outfile /vagrant/#{node['database']['sean_lahman']['python']}"
end

