default['mysql']['server_root_password'] = 'root_password'
default['mysql']['port'] = '3306'
default['database']['name'] = 'sean_lahman'
default['database']['user']['admin']['name'] = 'admin'
default['database']['user']['admin']['password'] = 'admin_password'
default['database']['user']['app']['name'] = 'app'
default['database']['user']['app']['password'] = 'app_password'
default['database']['sean_lahman']['sql'] = ['lahman2013_tables.sql', 'lahman2013_tables_plus.sql']
default['database']['sean_lahman']['python'] = 'tables.py'