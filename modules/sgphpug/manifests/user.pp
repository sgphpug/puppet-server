define sgphpug::user(
	$public_key = ''
)
{
	group{
		$title:
			ensure => present
	}

	user {
		$title:
			ensure => present,
			groups => [$title, 'wheel'],
			home => "/home/$title",
			require => [ Group[$title] ]
			;
	}

	file {
		"/home/$title":
			ensure => directory,
			owner => $title,
			group => $title,
			require => [ Group[$title] ]
			;
		"/home/$title/.ssh/":
			ensure => directory,
			owner => $title,
			group => $title,
			require => [ Group[$title] ]
			;
		"/home/$title/.ssh/authorized_keys":
			ensure => present,
			content => $public_key,
			owner => $title,
			group => $title,
			require => [ File["/home/$title/.ssh/"], Group[$title] ]
			;
	}
}