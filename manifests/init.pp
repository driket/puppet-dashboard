class mv_puppet_dashboard inherits mv_puppet_dashboard::params {
	include mv_puppet_dashboard::packages
	include mv_puppet_dashboard::config
	include mv_puppet_dashboard::service
}
