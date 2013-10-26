#
# Cookbook Name:: webserver
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'apache2::default'
web_app "default" do
  server_name '192.168.33.10'
  server_aliases [node['fqdn'], "my-site.example.com"]
  docroot "/vagrant/htdocs"
end

template "/etc/httpd/conf.d/phpmyadmin.conf" do
  notifies :reload, "service[apache2]", :delayed
end
