#
# Cookbook Name:: migrate
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'database::mysql'

mysql_connection_info = {:host => "localhost",
                         :username => 'root',
                         :password => node['mysql']['server_root_password']}


# create database
mysql_database node['database']['name'] do
  connection mysql_connection_info
  action :create
end


# create & grant admin username
mysql_database_user node['database']['user']['admin']['name'] do
  connection mysql_connection_info
  password node['database']['user']['admin']['password']
  database_name node['database']['name']
  privileges [:all]
  action [:create, :grant]
end


# create & grant application user
mysql_database_user node['database']['user']['app']['name'] do
  connection mysql_connection_info
  password node['database']['user']['app']['password']
  database_name node['database']['name']
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
    command "mysql -u#{node['database']['user']['admin']['name']} -D#{node['database']['name']} -p#{node['database']['user']['admin']['password']} < /tmp/#{query}"
  end

end


# generate SQLAlchemy model code
execute node['database']['sean_lahman']['python'] do
  command "sqlacodegen mysql://#{node['database']['user']['admin']['name']}:#{node['database']['user']['admin']['password']}@localhost:#{node['mysql']['port']}/#{node['database']['name']} --outfile /vagrant/#{node['database']['sean_lahman']['python']}"
end

