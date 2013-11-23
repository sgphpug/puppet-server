class sgphpug::users
{
	user {
		'laurence':
			ensure => present,
			groups => ['laurence', 'wheel'],
			home => '/home/laurence'
	}
}