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

# Install Redis Commander
npm_package "redis-commander" do
	action :install
end 