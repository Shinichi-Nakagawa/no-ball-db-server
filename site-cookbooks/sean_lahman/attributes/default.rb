default['home'] = '/home/vagrant'
default['database']['user']['app']['name'] = 'app'
default['database']['user']['app']['password'] = 'app_password'
default['sean_lahman']['dirs'] = ['script', 'data']
default['sean_lahman']['archive'] = 'lahman-csv_2014-02-14.zip'  # http://www.seanlahman.com/baseball-archive/statistics/ のconmma-delimited version(アーカイブ)
default['sean_lahman']['directory'] = "#{default['home']}/data/source"
default['sean_lahman']['create_database'] = "#{default['home']}/script/create_database.py"
