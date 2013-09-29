#
# Cookbook Name:: laravel
# Recipe:: packages
#
# Copyright 2013, Mathias Hansen
#

# Makes sure apt is up to date
include_recipe "apt"

# Install packages
node['laravel']['packages'].each do |a_package|
  package a_package
end

# Make sure node and npm is up to date
package "node" do
	action :install
	notifies :install, 'package[npm]'
end

package "npm" do
	action :nothing
	notifies :run, 'bash[npm-packages]'
end

# Install Redis Commander & Grunt
bash "npm-packages" do
  action :nothing
  code <<-EOH
    npm install -g redis-commander
    npm install -g grunt-cli
  EOH
end