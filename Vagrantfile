# -*- mode: ruby -*-
# vi: set ft=ruby :

# General project settings
#################################

# NOTE: Remember to run "vagrant reload" after changing any of these

# IP Address for the host only network, change it to anything you like
# but please keep it within the IPv4 private network range
ip_address = "172.22.22.22"

# The project name is base for directories, hostname and alike
project_name = "projectname"

# MySQL and PostgreSQL password - feel free to change it to something
# more secure
database_password = "laravel"

# Vagrant configuration
#################################

Vagrant.configure("2") do |config|
    # Enable Berkshelf support
    config.berkshelf.enabled = true

    # Define VM box to use
    config.vm.box = "precise32"
    config.vm.box_url = "http://files.vagrantup.com/precise32.box"

    # Set share folder
    config.vm.synced_folder "./" , "/var/www/" + project_name + "/", :mount_options => ["dmode=777", "fmode=666"]

    # Use hostonly network with a static IP Address and enable
    # hostmanager so we can have a custom domain for the server
    # by modifying the host machines hosts file
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.vm.define project_name do |node|
        node.vm.hostname = project_name + ".local"
        node.vm.network :private_network, ip: ip_address
        node.hostmanager.aliases = [ "www." + project_name + ".local" ]
    end
    config.vm.provision :hostmanager

    # Make sure that the newest version of Chef have been installed
    config.vm.provision :shell, :inline => "apt-get update -qq && apt-get install make ruby1.9.1-dev --no-upgrade --yes"
    config.vm.provision :shell, :inline => "gem install chef --version 11.6.0 --no-rdoc --no-ri --conservative"

    # Povision using Chef Solo
    config.vm.provision :chef_solo do |chef|
        chef.add_recipe "laravel::packages"
        chef.add_recipe "laravel::web_server"
        chef.add_recipe "laravel::vhost"
        chef.add_recipe "memcached"
        chef.add_recipe "redisio::install"
        chef.add_recipe "redisio::enable"
        chef.add_recipe "beanstalkd"
        chef.add_recipe "beanstalk_console"
        chef.add_recipe "laravel::db"
        chef.add_recipe "postgresql::server"
        chef.add_recipe "postfix"
        chef.add_recipe "phpunit"
        chef.json = {
            :laravel => {
                # Project name
                :name           => project_name,

                # Name of MySQL database that should be created
                :db_name        => project_name,

                # Server name and alias(es) for Apache vhost
                :server_name    => project_name + ".local",
                :server_aliases =>  [ "www." + project_name + ".local" ],

                # Document root for Apache vhost
                :docroot        => "/var/www/" + project_name + "/public",

                # General packages
                :packages       => %w{ vim git screen curl },

                # npm packages that should be installed
                :npm_packages   => %w{ redis-commander grunt-cli }
            },
            :apache => {
                :default_modules         => %w{ status alias auth_basic authn_file autoindex dir env mime negotiation setenvif rewrite ssl }
            },
            :npm => {
                :version                 => "1.3.11"
            },
            :xdebug => {
                :cli_color               => 1,
                :scream                  => 0,
                :remote_enable           => "On",
                :remote_autostart        => 0,
                :remote_mode             => "req",
                :remote_connect_back     => 1,
                :idekey                  => "macgdbp",
                :file_link_format        => "txmt://open?url=file://%f&line=%1",
                :profiler_enable_trigger => 0,
                :profiler_enable         => 0,
                :profiler_output_dir     => "/tmp/cachegrind"
            },
            :php => {
                # Customize PHP modules here
                :packages                => %w{ php5 php5-dev php5-cli php-pear php5-apcu php5-mysql php5-curl php5-mcrypt php5-memcached php5-gd php5-json },

                # It is necessary to specify a custom conf dir as we are using Apache 2.4
                :ext_conf_dir            => "/etc/php5/mods-available"
            },
            :beanstalkd => {
                :start_during_boot       => true
            },
            :phpunit => {
                :install_method          => 'composer'
            },
            :mysql => {
                # Feel free to change the password to something more secure
                :server_root_password    => database_password,
                :server_repl_password    => database_password,
                :server_debian_password  => database_password,
                :bind_address            => ip_address,
                :allow_remote_root       => true
            },
            :postgresql => {
                :users => [{
                    :username            => "root",
                    :password            => database_password,
                    :superuser           => true,
                    :createdb            => true,
                    :login               => true
                }],
                :listen_addresses        => "*",
                :pg_hba => [ # Make sure we have remote access
                    { :type => "local", :db => "all", :user => "postgres", :addr => "",             :method => "peer" },
                    { :type => "local", :db => "all", :user => "all",      :addr => "",             :method => "peer" },
                    { :type => "host",  :db => "all", :user => "all",      :addr => "127.0.0.1/32", :method => "md5" },
                    { :type => "host",  :db => "all", :user => "all",      :addr => "::1/128",      :method => "md5" },
                    { :type => "host",  :db => "all", :user => "all",      :addr => "0.0.0.0/0",    :method => "md5" }
                ]
            }
        }
    end
end
