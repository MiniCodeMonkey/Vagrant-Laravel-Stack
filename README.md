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

Place your website in the `public_html` folder

## Usage
Start the VM

	$ cd Vagrant-LAMP-Stack
	$ vagrant up

You can now access your project at [http://projectname.local](http://projectname.local)

![Screenshot of up-and-running server](http://i.imgur.com/TP1i9Zd.png)

## Installed software
* Apache 2
* MySQL
* PHP 5.5 (with mysql, curl, mcrypt, memcached, gd)
* memcached
* postfix
* vim, git, screen, curl, composer

## Default credentials
### MySQL
* Username: root
* Password: root
* Host: localhost
* Port: 3306

**Note:** Remote MySQL access is enabled by default, so you can access the MySQL database using your favorite MySQL client with the above credentials (and using e.g. *projectname.local* as hostname).

### Memcached
* Port: 11211
