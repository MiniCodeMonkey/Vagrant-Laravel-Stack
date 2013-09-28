#
# Cookbook Name:: laravel
# Recipe:: db
#
# Credits: David Stanley (https://github.com/davidstanley01/vagrant-chef/)
#

# Install MySQL server & MySQL client
include_recipe "mysql"
include_recipe "mysql::server"

# Create database if it doesn't exist
ruby_block "create_#{node['laravel']['name']}_db" do
    block do
        %x[mysql -uroot -p#{node['mysql']['server_root_password']} -e "CREATE DATABASE #{node['laravel']['db_name']};"]
    end 
    not_if "mysql -uroot -p#{node['mysql']['server_root_password']} -e \"SHOW DATABASES LIKE '#{node['laravel']['db_name']}'\" | grep #{node['laravel']['db_name']}";
    action :create
end