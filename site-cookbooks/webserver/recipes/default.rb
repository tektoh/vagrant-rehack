#
# Cookbook Name:: webserver
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'apache2::default'
web_app "webserver" do
	server_name '192.168.33.10'
	server_aliases [node['fqdn'], "my-site.example.com"]
  docroot "/vagrant/htdocs"
end

%w{php-common php-mbstring php-xml php-mcrypt php-devel php-process php-cli php-pear php-mysql mysql-server}.each do |p|
    package p do
        action :install
				notifies :reload, "service[apache2]", :delayed
    end
end

template "/etc/httpd/conf.d/phpmyadmin.conf" do
  notifies :reload, "service[apache2]", :delayed
end