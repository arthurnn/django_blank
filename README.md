This is a blank django project.

Already set using:

-Vagrant

-MySQL

-South(migration)

-boto(amazon aws)

-Boilerplate HTML5


Installation:

-First of all, install Vagrant:
	> gem install vagrant
	
-After install it, go to the project project and run:
	> vagrant up
	
-See it working:
	go to: http://localhost:8888
	or go to: http://33.33.33.88
	
	

Troubleshooting:

-If you are having issues at step 1(installing Vagrant):
	Make sure you have the latest version of Ruby in your machine, an easy way to install and handle Ruby in Linux machines is using: http://beginrescueend.com/rvm/install/
	
-Issues running VAGRANT UP:
	If it takes a while, and you get an error after a while, try running:
		> vagrant provision
	If still doesnt work, try this:
		> vagrant destroy
		> vagrant up
		
		

For any further question, fell free to tweet me: @arthurnn89


