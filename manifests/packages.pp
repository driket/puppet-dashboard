class mv_puppet_dashboard::packages {
	require('mv_puppet_dashboard::params')

	package {'mv_puppet_dashboard':
		name 		=> $mv_puppet_dashboard::packages,
		ensure 		=> present,
	}

}
