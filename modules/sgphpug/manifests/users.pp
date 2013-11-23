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
			require => [ Group['laurence'] ]
			;
		'miccheng':
			ensure => present,
			groups => ['miccheng', 'apache', 'wheel'],
			home => '/home/miccheng',
			require => [ Group['miccheng'] ]
			;
		'sam':
			ensure => present,
			groups => ['sam', 'apache', 'wheel'],
			home => '/home/sam',
			require => [ Group['sam'] ]
			;
	}

	file {
		"/home/laurence":
			ensure => directory,
			owner => 'laurence',
			group => 'laurence',
			require => [ Group['laurence'] ]
			;
		"/home/laurence/.ssh/":
			ensure => directory,
			owner => 'laurence',
			group => 'laurence',
			require => [ Group['laurence'] ]
			;
		"/home/laurence/.ssh/authorized_keys":
			ensure => present,
			content => "",
			owner => 'laurence',
			group => 'laurence',
			require => [ File['/home/laurence/.ssh/'], Group['laurence'] ]
			;
		"/home/miccheng":
			ensure => directory,
			owner => 'miccheng',
			group => 'miccheng',
			require => [ Group['miccheng'] ]
			;
		"/home/miccheng/.ssh/":
			ensure => directory,
			owner => 'miccheng',
			group => 'miccheng',
			require => [ Group['miccheng'] ]
			;
		"/home/miccheng/.ssh/authorized_keys":
			ensure => present,
			content => "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAxRRDYFyVZ9oJDag2FBuxL9MzSVXSzJh/vT8KSEF6KYUvjPW257lK+iIWeK0x5yAHZ1OetJ9s0nYZRIfkLkf1HlJMrRRYgaZRKZuzlqmE00ozP6LHPSW4DaxPT+NElnUYoznlgCCM9A+A4ZNdOUgBHXc44qY0QdmDRQBTgS5JLEoSafa6o3MU3gvTPwK7POVxFtm+pmfix4OOxqNN0S/qoHMCfKwrp4737CEpJgqE6cgopNkG9pnFC90ZgYK/bbpD24KKRNf/aXhJsKEU+81c4WL88P6vZR3NIioNhqjgpqFFryXNc6P0F47XpFjdz9L2kvu4GuVQxEeHyV78ozxrfw== miccheng@miccheng-laptop
",
			owner => 'miccheng',
			group => 'miccheng',
			require => [ File['/home/miccheng/.ssh/'], Group['miccheng'] ]
			;
		"/home/sam":
			ensure => directory,
			owner => 'sam',
			group => 'sam',
			require => [ Group['sam'] ]
			;
		"/home/sam/.ssh/":
			ensure => directory,
			owner => 'sam',
			group => 'sam',
			require => [ Group['sam'] ]
			;
		"/home/sam/.ssh/authorized_keys":
			ensure => present,
			content => "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAmKHXneslzeZQmueuMALCM5WXii2uxlU5cb+TxeQ0aTJftWM4sD2AXXgQ7Jhtf3X/byhdrVsbWyB5pZ3NcfDWUEBnQWsZ3BVahapGed0Knxxbf0201NBwZ/ViisTMyCKmH6+Eb4k4j8Ox44ItkZXeg3L5seWx3/ibjjeBWCxijsqiPCSEghKtmoTmXNC4aaGmyNk3eabcRNkH0uViaH4mDukwapynqRreRh7Hb35aTotPRZkm2cfq2DnvkUIDgx8ncksmKfHJBPZXWuLTw2AZBC152QAd8HkO9DCSvUrZnJkv6Qvy5nzacFekqIpwg58nqcCDbn2nLzB7sMcQSueWow== puppy",
			owner => 'sam',
			group => 'sam',
			require => [ File['/home/sam/.ssh/'], Group['sam'] ]
			;
	}
}