default['home'] = '/home/vagrant'
default['sean_lahman']['dirs'] = ['script', 'data']
default['sean_lahman']['archive'] = 'lahman-csv_2015-01-24.zip'  # http://www.seanlahman.com/baseball-archive/statistics/ のconmma-delimited version(アーカイブ)
default['sean_lahman']['directory'] = "#{default['home']}/data/source"
default['sean_lahman']['create_database'] = "#{default['home']}/script/create_database.py"
