class sgphpug::users
{
	group{
		[
			'miccheng',
			'laurence',
			'sam',
		]:
			ensure => present
	}

	user {
		'laurence':
			ensure => present,
			groups => ['laurence', 'apache', 'wheel'],
			home => '/home/laurence',
			require => [ Group['laurence'], File['/home/laurence'] ]
			;
		'miccheng':
			ensure => present,
			groups => ['miccheng', 'apache', 'wheel'],
			home => '/home/miccheng',
			require => [ Group['miccheng'], File['/home/miccheng'] ]
			;
		'sam':
			ensure => present,
			groups => ['sam', 'apache', 'wheel'],
			home => '/home/sam',
			require => [ Group['sam'], File['/home/sam'] ]
			;
	}

	file {
		"/home/laurence":
			ensure => directory,
			owner => 'laurence',
			group => 'laurence',
			require => [ Group['laurence'] ]
			;
		"/home/miccheng":
			ensure => directory,
			owner => 'miccheng',
			group => 'miccheng',
			require => [ Group['miccheng'] ]
			;
		"/home/sam":
			ensure => directory,
			owner => 'sam',
			group => 'sam',
			require => [ Group['sam'] ]
			;
	}
}