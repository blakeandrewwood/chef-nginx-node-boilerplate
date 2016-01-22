#
# Get nginx package 
#
package 'nginx'

#
# Delete original sites-enabled config
#
file '/etc/nginx/sites-enabled/default' do
  action :delete
  notifies :reload, 'service[nginx]', :delayed
end

#
# Add sites-enabled config 
#
template '/etc/nginx/sites-enabled/express' do
  source 'nginx/sites-enabled/express.erb'
  user 'root'
  group 'root'
  mode '0644'
  notifies :reload, 'service[nginx]', :delayed
end

#
# Add nginx.conf 
#
cookbook_file '/etc/nginx/nginx.conf' do
  source 'nginx/nginx.conf'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :reload, 'service[nginx]', :delayed
end

#
# Restart nginx
#
service 'nginx' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end
