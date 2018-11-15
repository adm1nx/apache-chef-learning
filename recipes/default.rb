#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
package 'httpd'

apache_vhost 'welcome'do 
  action :remove
end

apache_vhost 'users' do
  notifies :restart, 'service[httpd]'
end

apache_vhost 'admins' do
  site_port 8080
  notifies :restart, 'service[httpd]'
end

service 'httpd' do
  action [:enable, :start]
end
