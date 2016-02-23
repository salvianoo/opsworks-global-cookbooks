include_recipe "myapp"
include_recipe "apache2"

# php 7.0
execute "add-apt-repository" do
  command "add-apt-repository ppa:ondrej/php"
end

execute "apt-get update" do
  command "sudo apt-get update"
end

node['php7']['packages'].each do |pkg|
  apt_package pkg do
    action :install
    options '--force-yes'
  end
end

execute "Enable mods: php7.0" do
  command "sudo a2enmod php7.0"
end
