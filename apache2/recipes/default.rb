apt_package "apache2" do
  action :install
  notifies :start, "service[apache2]"
end

execute "Disable Event" do
  command "sudo a2dismod mpm_event"
  notifies :restart, "service[apache2]"
end

execute "Enable mods: prefork rewrite" do
  command "sudo a2enmod mpm_prefork rewrite"
  notifies :restart, "service[apache2]"
end