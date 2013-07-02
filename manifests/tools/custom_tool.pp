define mv_puppet_dashboard::tools::custom_tool (	$options  = [], ) {
	require('mv_puppet_dashboard::packages')
	require('mv_puppet_dashboard')

    #file { "${mv_puppet_dashboard::config_path}/filename":
    #    ensure 	=> file,
    #    content => template("mv_puppet_dashboard/filename.erb"),
    #    mode 	=> "0644",
    #    owner 	=> 'root',
    #    group 	=> 'root',
	#	require => Package["mv_puppet_dashboard"],
    #    notify	=> Service["mv_puppet_dashboard"],
    #}
}