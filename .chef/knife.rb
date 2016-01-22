current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "NODE_NAME"
client_key               "#{current_dir}/CLIENT.pem"
validation_client_name   "ORG_VALIDATOR"
validation_key           "#{current_dir}/ORG_VALIDATOR.pem"
chef_server_url          "https://IP_OR_HOSTNAME/organizations/ORG"
syntax_check_cache_path  "#{ENV['HOME']}/.chef/syntaxcache"
cookbook_path            ["#{current_dir}/../cookbooks"]