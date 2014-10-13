#
# Cookbook Name:: python_package
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "python"


for lib in node['pip']['install'] do
  python_pip lib do
    action :install
  end
end
