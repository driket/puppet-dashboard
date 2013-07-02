define mv_puppet_dashboard::tools::setup_puppetdashboard (	
																$db_name  				= 'dashboard',
	 															$db_username  		= 'dashboard',
																$db_password			= 'password',
																$db_host 					= 'localhost',
																$db_charset				= 'utf8',
																$db_rootpassword 	= '',
															) 
{
	require('mv_puppet_dashboard::packages')
	require('mv_puppet_dashboard')

	# set proper rights for app
	#
	file { "/usr/share/puppet-dashboard":
	  owner 	=> 'www-data',
	  group 	=> 'www-data',
		require => Package["mv_puppet_dashboard"],
		notify  => Service['puppet-dashboard'],
		recurse => true,
	}
	
	file { "/var/run/puppet-dashboard.pid":
	  mode 		=> "0640",
	  owner 	=> 'www-data',
	  group 	=> 'www-data',
	}
	
	# puppet-dashboard default file
	# 
  file { "/etc/default/puppet-dashboard":
  	ensure 	=> file,
    content => template("mv_puppet_dashboard/default-puppet-dashboard"),
    mode 		=> "0644",
    owner 	=> 'www-data',
    group 	=> 'www-data',
		require => Package["mv_puppet_dashboard"],
  }
	
	# ensure service started 
	# 
	service { 'puppet-dashboard':
		name 			=> 'puppet-dashboard',
		ensure 		=> running,
	}
	
	# puppet-dashboard replacement status file
	# 
  file { "/etc/init.d/puppet-dashboard":
  	ensure 	=> file,
    content => template("mv_puppet_dashboard/puppet-dashboard.erb"),
    mode 		=> "750",
    owner 	=> 'root',
    group 	=> 'root',
		require => Package["mv_puppet_dashboard"],
  }
	
	# puppet-dashboard-workers default file
	# 
  file { "/etc/default/puppet-dashboard-workers":
  	ensure 	=> file,
    content => template("mv_puppet_dashboard/default-puppet-dashboard-workers"),
    mode 		=> "0644",
    owner 	=> 'www-data',
    group 	=> 'www-data',
		require => Package["mv_puppet_dashboard"],
  }
	
	# ensure service (workers) started 
	# 
	service { 'puppet-dashboard-workers':
		name 			=> 'puppet-dashboard-workers',
		ensure 		=> running,
	}
	
	# app db settings
	# 
  file { "${mv_puppet_dashboard::config_path}/database.yml":
  	ensure 	=> file,
    content => template("mv_puppet_dashboard/database.yml.erb"),
    mode 		=> "0600",
    owner 	=> 'www-data',
    group 	=> 'www-data',
		require => Package["mv_puppet_dashboard"],
  }
	
	# app patch -> open connection to Ajax
	# 
  file { "/usr/share/puppet-dashboard/app/controllers/application_controller.rb":
  	ensure 	=> file,
    content => template("mv_puppet_dashboard/application_controller.rb.erb"),
    mode 		=> "0640",
    owner 	=> 'www-data',
    group 	=> 'www-data',
		require => Package["mv_puppet_dashboard"],
		notify  => Service['puppet-dashboard'],
  }
}