**WARNING** This project is not complete yet.

# Vagrant Laravel Stack
A Vagrant stack designed for Laravel 4 development and deployment.

`Chef` is used for provisioning and `Berkshelf` is used to manage cookbooks.

***Authors note:*** *I've been wanting to do a Laravel-specific Vagrant stack for a while, and when Taylor Otwell [tweeted out](https://twitter.com/taylorotwell/status/383722109521776640) that he was looking for such a thing, I decided to build it out based on [his requirements](http://paste.laravel.com/V3q).*

## Requirements
* [VirtualBox](https://www.virtualbox.org)
* [Vagrant](http://vagrantup.com)
* [Berkshelf](http://berkshelf.com)
	* `gem install berkshelf`
* [vagrant-berkshelf](https://github.com/riotgames/vagrant-berkshelf)
	* `vagrant plugin install vagrant-berkshelf`
* [vagrant-hostmanager](https://github.com/smdahlen/vagrant-hostmanager)
	* `vagrant plugin install vagrant-hostmanager`

## Installation
First, install Laravel 4 in to a local directory on your machine.

	$ composer create-project laravel/laravel projectname --prefer-dist

All you need to do now, in order to run your Laravel installation using Vagrant is to place the `Vagrantfile` and `Berksfile` from this repository in the root of your Laravel installation

	$ cd projectname
	$ curl -O https://raw.github.com/MiniCodeMonkey/Vagrant-Laravel-Stack/master/Vagrantfile
	$ curl -O https://raw.github.com/MiniCodeMonkey/Vagrant-Laravel-Stack/master/Berksfile

Optionally, you can configure the `Vagrantfile` to specify the project name or customize the installed packages or modules.

	$ vim Vagrantfile

You can now start the Virtual Machine and initialize the provisioning process.

	$ vagrant up

The first run may take up to 15 minutes to complete, after that you can access your project at [http://projectname.local](http://projectname.local)

## Configuration
The stack is designed in such a way that it is very easy to configure.
Just update the `Vagrantfile` to change installed npm packages, apt packages, php modules, etc.

## Installed software
* Apache 2
* MySQL
* PostgreSQL
* PHP 5.5 (with apcu, mysql, curl, mcrypt, memcached, gd)
* memcached
* Redis
* Beanstalkd
* Postfix
* XDebug
* Grunt
* composer
* curl
* vim, git, screen

## Default credentials
### MySQL
* Username: root
* Password: root
* Port: 3306

### PostgreSQL
* Username: root
* Password: root
* Port: 5432

**Note:** Remote database access is enabled by default, so you can access the MySQL or PostgreSQL database using your favorite client with the above credentials (and using e.g. *projectname.local* as hostname).


### Redis
* Port: 6379

### Beanstalkd
* Port: 11300

### Memcached
* Port: 11211