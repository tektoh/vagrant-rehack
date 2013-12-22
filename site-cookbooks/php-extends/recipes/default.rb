#
# Cookbook Name:: php-extends
# Recipe:: default
#
# Copyright 2013, Shinichi Segawa
#

node['php-extends']['packages'].each do |pkg|
  package pkg do
    action :install
    notifies :reload, "service[apache2]", :delayed
  end
end 
