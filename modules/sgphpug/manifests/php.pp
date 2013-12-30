class sgphpug::php
{
	package { [
			"uuid-php",
			"xcache-admin"
		]:
			ensure => present,
			require => Yumrepo['epel']
			;
	}

	class { "::php::cli": }
	class { '::php::mod_php5': }
	php::ini { '/etc/php.ini':
		display_errors => 'Off',
		date_timezone => 'Asia/Singapore',
		error_reporting => 'E_ALL & ~E_NOTICE & ~E_DEPRECATED',
		short_open_tag => 'On',
		memory_limit => '128M',
		file_uploads => 'On',
		upload_max_filesize => '2M',
		allow_url_fopen => 'On',
		html_errors => 'On'
	}
	php::module { [
			'devel',
			'gd',
			'mcrypt',
			'intl',
			'mbstring',
			'mysql',
			'pdo',
			'pear',
			'soap',
			'xml',
			'pecl-memcache',
			'xcache',
			'pear-Net-Curl'
		]:
		require => [ Class['php::cli'], Yumrepo['epel'], Package['uuid-php'] ]
	}
	class { '::composer':
		command_name => 'composer',
		target_dir   => '/usr/local/bin',
		require => Class['php::cli']
	}
}