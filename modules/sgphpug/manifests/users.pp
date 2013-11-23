class sgphpug::users
{
	group{
		'laurence':
			ensure => present
	}

	user {
		'laurence':
			ensure => present,
			groups => ['laurence', 'apache', 'wheel'],
			home => '/home/laurence',
			require => [ Group['laurence'], File['/home/laurence'] ]
	}

	file {
		"/home/laurence":
			ensure => directory,
			owner => 'laurence',
			group => 'laurence'
			require => [ Group['laurence'] ]
	}
}