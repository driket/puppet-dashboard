class mv_puppet_dashboard::config {
	require('mv_puppet_dashboard::packages')

	/*
    file { "/etc/init.d/mv-puppet-dashboard-workers":
        ensure 	=> file,
        content => template("mv_puppet_dashboard/mv-puppet-dashboard-workers.erb"),
        mode 	=> "0755",
        owner 	=> 'root',
        group 	=> 'root',
		require => Package["mv_puppet_dashboard"],
        notify	=> Service["mv_puppet_dashboard"],
    }	
	*/
}
