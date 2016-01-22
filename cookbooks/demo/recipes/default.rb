#
# Cookbook Name:: demo
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'demo::users'
include_recipe 'demo::nginx'
include_recipe 'demo::nvm'
include_recipe 'demo::node-applications'