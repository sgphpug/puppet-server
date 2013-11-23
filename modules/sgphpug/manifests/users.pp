class sgphpug::users
{
	user {
		'laurence':
			ensure => present,
			groups => ['apache', 'wheel']
	}
}