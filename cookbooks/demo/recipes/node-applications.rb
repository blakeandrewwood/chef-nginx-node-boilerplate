#
# Install global packages 
#
bash 'npm-install-global' do
  guard_interpreter :bash
  user 'app'
  group 'app'
  cwd '/home/app'
  flags '-l'
  code <<-EOH
    npm install -g forever
  EOH
  environment({
    'HOME' => '/home/app'
  })
  not_if 'which forever',
    :flags => '-l'
end

#
# Make express directory 
#
directory '/home/app/express' do
  owner 'app' 
  group 'app' 
  action :create
end

#
# Copy express app 
#
cookbook_file '/home/app/express/server.js' do
  source 'express/server.conf'
  owner 'app'
  group 'app'
end

#
# Copy package.json 
#
cookbook_file '/home/app/express/package.json' do
  source 'express/package.json.conf'
  owner 'app'
  group 'app'
end

#
# Express app npm install 
#
bash 'npm-install' do
  guard_interpreter :bash
  user 'app'
  group 'app'
  cwd '/home/app/express'
  flags '-l'
  code <<-EOH
    npm install
  EOH
  environment({
    'HOME' => '/home/app'
  })
end

#
# Create express app service 
#
template '/etc/init.d/express' do
  source 'init.d/nodejs-service.erb'
  user 'root'
  group 'root'
  mode '0755'
  variables({
    :user => 'app',
    :environment => 'none',
    :port => '3000',
    :directory => '/home/app/express',
    :index => 'server.js'
  })
end

#
# Start express app service 
#
service 'express' do
  supports :status => true, :restart => true
  action [ :enable, :start ]
end