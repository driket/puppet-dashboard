# configuer le produit ici
class mv_puppet_dashboard::params {

	$packages 				= ['puppet-dashboard']
	$service_name 		= 'puppet-dashboard'
	$config_path 			= '/etc/puppet-dashboard/'
}
