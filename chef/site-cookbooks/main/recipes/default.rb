#
# Cookbook Name:: main
# Recipe:: default
#
# Copyright 2012, Cogini
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'
include_recipe 'yii'
include_recipe 'mysql::server'
include_recipe 'apache2'
include_recipe 'apache2::mod_rewrite'
include_recipe 'apache2::mod_php5'
include_recipe 'php'
include_recipe 'php::module_mysql'
include_recipe 'php::module_curl'


db_user = node[:giasu][:db][:user]

mysql_user db_user do
    password node[:giasu][:db][:password]
end

mysql_db 'giasu' do
    owner db_user
end


user 'giasu' do
    action :create
    supports :managed_home => true
end


directory node[:giasu][:log_dir] do
    action :create
    recursive true
end


template '/etc/apache2/sites-available/giasu' do
    source 'apache-giasu.erb'
    mode '0644'
end

template "#{node[:giasu][:root_dir]}/index.php" do
    source 'yii-index.php.erb'
    mode '0644'
end

apache_site 'default' do
    action :disable
end

apache_site 'giasu' do
    action :enable
end
