#
# Cookbook Name:: davidstweaks
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# I don't want the default tmux.conf being overridden by the tmux cookbook
file "/etc/tmux.conf" do
  action :delete
end

# Copy in gunicorn init script for graphite
cookbook_file "/etc/init.d/gunicorn-graphite" do
  source "init-gunicorn-graphite"
  mode "755"
  action :create
end

service "gunicorn-graphite" do
  action [:enable, :start]
end

# Kill uwsgi as setup by graphite
execute "stop_wsgi" do
  command "sv stop graphite-web"
end

# Copy in graphite site for nginx
cookbook_file "/etc/nginx/sites-available/graphite" do
  source "nginx-site-graphite"
  mode "755"
  action :create
end

# Enable graphite site in nginx
execute "nxensite graphite"

service "nginx" do
  action :reload
end