class sgphpug::apache
{
	class {'::apache':
		default_vhost => false,
        sendfile => 'Off'
	}
	apache::listen { "80": }
    apache::namevirtualhost { "*:80": }

    apache::vhost { "phpug.sg":
        serveraliases => "www.phpug.sg",
		port    => '80',
		docroot => '/var/www/phpug.sg',
		directories => [
			{ path => '/var/www/phpug.sg', order => 'Allow,Deny', allow => 'from all', allow_override => ['All'] }
		],
	}

	file{
        [
            "/var/www"
        ]:
            ensure => directory,
            ;
        "/var/www/phpug.sg":
            ensure => directory,
            require => File['/var/www']
            ;
   	}
}