class sgphpug::php
{
	package { [
			"uuid-php",
			"xcache-admin"
		]:
			ensure => present
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
			'pecl-xdebug',
			'xcache',
			'pear-Net-Curl',
			'pecl-xhprof',
			'phpunit-PHPUnit',
			'phpunit-PHPUnit-MockObject',
			'phpunit-DbUnit'
		]:
		require => [ Class['php::cli'], Exec['grap-epel'], Package['uuid-php'] ]
	}
}