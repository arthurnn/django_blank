
require_recipe "apt"
require_recipe "mysql::server"


mysql_shell = "/usr/bin/mysql -u root -p#{node[:mysql_password]}"
mysqladmin_shell = "/usr/bin/mysqladmin -u root -p#{node[:mysql_password]}"

execute "create #{node['project_name']} database" do
  #command "#{mysqladmin_shell} create #{node['adidas']['db']['database']} --default-character-set=utf8"
  command "echo \"CREATE DATABASE #{node['project_name']} CHARACTER SET utf8;\" | #{mysql_shell}"
  not_if %[echo "show databases" | #{mysql_shell} | grep #{node['project_name']}]
end

require_recipe "python"
require_recipe "python::pip"
require_recipe "apache2"
require_recipe "apache2::mod_wsgi"


execute "install gettext..." do
    cwd node[:home_folder]
    user "root"
    command "sudo apt-get install gettext -y"
end

execute "install_requirements" do
    cwd node[:home_folder]
    user "root"
    command "pip install -r requirements.txt"
end

execute "install python-imaging" do
    cwd node[:home_folder]
    user "root"
    command "sudo apt-get install python-imaging -y"
end

execute "django syncdb in #{node[:home_folder]}" do
    cwd "#{node[:home_folder]}"
    user "root"
    command "python manage.py syncdb --noinput"
end

execute "django migrate in #{node[:home_folder]}" do
    cwd "#{node[:home_folder]}"
    user "root"
    command "python manage.py migrate --all --noinput"
end

execute "django collectstatic in #{node[:home_folder]}" do
    cwd "#{node[:home_folder]}"
    user "root"
    command "python manage.py collectstatic --noinput"
end

template "#{node[:apache][:dir]}/sites-available/default" do
  source "vagrant.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, resources(:service => "apache2")
end