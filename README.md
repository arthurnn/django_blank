Django Blank project
====================
This is a basic django project, which will run in a virtual machine and using vagrant to create/manage it.  

http://vagrantup.com/


Important note
----------------
This project was not tested with the latest version of Vagrant 1.x. I will be updating this project soon to add support for the latest vagrant as well as latest Django.

What is included
----------------
* Vagrant 0.9
* MySQL
* Django 1.3.1
* South(migration)
* boto(amazon aws)
* Boilerplate HTML5


Installation
------------

* First of all, install Vagrant:  
	`gem install vagrant`
	
* After install it, go to the project folder and run:  
	`vagrant up`
	
* Working:  
	go to: `http://localhost:8888`
	or go to: `http://33.33.33.88`
	
	

Troubleshooting
---------------

* If you are having issues at step 1(installing Vagrant):
	Make sure you have the latest version of Ruby in your machine, an easy way to install and handle Ruby in Linux machines is using: http://beginrescueend.com/rvm/install/
	
* Issues running VAGRANT UP:
	If it takes a while, and you get an error after a while, try running:
		`vagrant provision`
	If still doesnt work, try this:
		`vagrant destroy`
		`vagrant up`
		
		

For any further question, fell free to tweet me: `@arthurnn`




[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/arthurnn/django_blank/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

