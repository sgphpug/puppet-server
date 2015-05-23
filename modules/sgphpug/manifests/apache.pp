class sgphpug::apache
{
	class {'::apache':
		default_vhost => false,
        sendfile => 'Off'
	}
	apache::listen { '80': }
    apache::namevirtualhost { '*:80': }

    apache::vhost { "phpug.sg":
        serveraliases => "www.phpug.sg",
		port    => '80',
		docroot => '/var/www/phpug.sg',
		directories => [
			{ path => '/var/www/phpug.sg', order => 'Allow,Deny', allow => 'from all', allow_override => ['All'] }
		],
	}

    apache::vhost { "phpconf.asia":
        serveraliases => "www.phpconf.asia",
        port    => '80',
        docroot => '/var/www/phpconf.asia',
        directories => [
            { path => '/var/www/phpconf.asia', order => 'Allow,Deny', allow => 'from all', allow_override => ['All'] }
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
        "/var/www/phpug.sg/index.php":
            ensure => present,
            content => template("${module_name}/phpug.sg/index.php.erb"),
            require => File['/var/www/phpug.sg']
            ;
        "/var/www/phpconf.asia":
            ensure => directory,
            require => File['/var/www']
            ;
        "/var/www/phpconf.asia/index.php":
            ensure => present,
            content => template("${module_name}/phpconf.asia/index.php.erb"),
            require => File['/var/www/phpconf.asia']
            ;
   	}
}