# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Enable Berkshelf support
  config.berkshelf.enabled = true

  # Define VM box to use
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  # Set share folder
  config.vm.synced_folder "./" , "/var/www/projectname/"

  # Use hostonly network with a static IP Address
  # and enable hostmanager
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.vm.define 'projectname' do |node|
    node.vm.hostname = 'projectname.local'
    node.vm.network :private_network, ip: '172.90.90.90'
    node.hostmanager.aliases = %w(www.projectname.local)
end
config.vm.provision :hostmanager

  # Enable and configure chef solo
  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "laravel::packages"
    chef.add_recipe "laravel::web_server"
    chef.add_recipe "laravel::vhost"
    chef.add_recipe "memcached"
    chef.add_recipe "redis"
    chef.add_recipe "beanstalkd"
    chef.add_recipe "laravel::db"
    chef.add_recipe "postfix"
    chef.json = {
        :laravel => {
            # Project name
            :name           => "projectname",

            # Name of MySQL database that should be created
            :db_name        => "dbname",

            # Server name and alias(es) for Apache vhost
            :server_name    => "projectname.local",
            :server_aliases => "www.projectname.local",

            # Document root for Apache vhost
            :docroot        => "/var/www/projectname/public_html",

            # General packages
            :packages       => %w{ vim git screen curl }
        },
        :mysql => {
            :server_root_password   => 'root',
            :server_repl_password   => 'root',
            :server_debian_password => 'root',
            :bind_address           => '172.90.90.90',
            :allow_remote_root      => true
        },
        :xdebug => {
            :cli_color               => 1,
            :scream                  => 0,
            :remote_enable           => 'On',
            :remote_autostart        => 0,
            :remote_mode             => 'req',
            :remote_connect_back     => 1,
            :idekey                  => 'macgdbp',
            :file_link_format        => 'txmt://open?url=file://%f&line=%1',
            :profiler_enable_trigger => 0,
            :profiler_enable         => 0,
            :profiler_output_dir     => '/tmp/cachegrind'
        },
        :php => {
            :packages                => %w{ php5 php5-dev php5-cli php-pear php5-apcu php5-mysql php5-curl php5-mcrypt php5-memcached php5-gd }
        },
        :beanstalkd => {
            :start_during_boot       => true
        }
    }
end
end