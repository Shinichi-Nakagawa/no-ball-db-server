database_config = Chef::EncryptedDataBagItem.load('database_config', 'default')
default['mysql']['server_root_password'] = database_config['users']['root']['password']
