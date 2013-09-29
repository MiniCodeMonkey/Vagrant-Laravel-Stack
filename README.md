**WARNING** This project is not complete yet.

# Vagrant Laravel Stack
A Vagrant stack designed for Laravel 4 development and deployment

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
Clone this repository

    $ git clone git@github.com:MiniCodeMonkey/Vagrant-Laravel-Stack.git

You can now start the Virtual Machine and make sure that everything works.

	$ cd Vagrant-LAMP-Stack
	$ vagrant up

Try to access your project at [http://projectname.local](http://projectname.local)

![Screenshot of up-and-running server](http://i.imgur.com/TP1i9Zd.png)

Last step would be to remove the `projectname` directory and install Laravel 4 instead.

	* rm -rf projectname
	* composer create-project laravel/laravel projectname --prefer-dist

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