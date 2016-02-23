execute "Apt-get update" do
  command "sudo apt-get update"
end

node['system']['packages'].each do |pkg|
  apt_package pkg do
    action :install
  end
end
