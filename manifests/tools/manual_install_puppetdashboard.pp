define mv_puppet_dashboard::tools::manual_install_puppetdashboard (	
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
	
	# install puppet dashboard script
  file { "/opt/install_puppet_dashboard.sh":
  	ensure 	=> file,
    content => template("mv_puppet_dashboard/install_puppet_dashboard.sh.erb"),
    mode 	=> "0700",
    owner 	=> 'root',
    group 	=> 'root',
		require => Package["mv_puppet_dashboard"],
  }
	
	# create db file
  file { "/opt/mv_puppet_dashboard.sql":
  	ensure 	=> file,
    content => template("mv_puppet_dashboard/mv_puppet_dashboard.sql.erb"),
    mode 	=> "0600",
    owner 	=> 'root',
    group 	=> 'root',
		require => Package["mv_puppet_dashboard"],
  }
}