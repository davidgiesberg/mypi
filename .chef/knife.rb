log_level                :info
log_location             STDOUT
node_name                'david'
client_key               '/Users/david/src/mypi/.chef/david.pem'
validation_client_name   'chef-validator'
validation_key           '/etc/chef-server/chef-validator.pem'
chef_server_url          'https://Davids-MacBook-Air.local:443'
syntax_check_cache_path  '/Users/david/src/mypi/.chef/syntax_check_cache'
cookbook_path [ './cookbooks' ]
