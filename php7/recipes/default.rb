include_recipe "myapp"
include_recipe "apache"

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
    notifies :restart, "service[apache2]"
  end
end
