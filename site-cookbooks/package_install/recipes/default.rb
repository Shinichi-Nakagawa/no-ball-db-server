#
# Cookbook Name:: package_install
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w{gcc make git libreadline-dev libreadline5 language-pack-ja-base language-pack-ja nkf libxml2-dev libxslt-dev g++ ruby-dev python-pip python-dev python-sqlalchemy python-mysqldb}.each do |pkg|
  package pkg do
    action :install
  end
end