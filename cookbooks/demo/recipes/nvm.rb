#
# include nvm recipe 
#
include_recipe 'nvm'

#
# Add sites-enabled config 
#
nvm_install 'v5.4.0'  do
  user 'app'
  group 'app'
  from_source false
  alias_as_default true
  action :create
  not_if { ::Dir.exist?('/home/app/.nvm') }
end
