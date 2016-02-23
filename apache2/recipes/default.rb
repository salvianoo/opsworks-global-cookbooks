apt_package "apache2" do
  action :install
end

service "apache2" do
  action [ :enable, :start ]
end

execute "Disable Event" do
  command "sudo a2dismod mpm_event"
  notifies :restart, "service[apache2]"
end

execute "Enable mods: prefork rewrite" do
  command "sudo a2enmod mpm_prefork rewrite"
  notifies :restart, "service[apache2]"
end
