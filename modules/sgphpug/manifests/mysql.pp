class sgphpug::mysql(
	$root_pwd
)
{
	File {
		owner   => "root",
		group   => "root",
		mode    => 644,
	}

	package {
		'mysql-devel':
			ensure => present
	}

	class { '::mysql': }
	class { '::mysql::server':
		config_hash => {
			'root_password' => $root_pwd,
			'bind_address'  => '0.0.0.0'
		},
	}
	mysql::server::config { 'lower_case_table_names_config':
		settings => "[mysqld]\nlower_case_table_names=1\n"
	}
	Database {
		require => Class['::mysql::server'],
	}
	Database_user {
		require => Class['::mysql::server'],
	}
	database_user {
		'root@%':
			password_hash => mysql_password($root_pwd)
			;
	}

	database_grant { [
			'root@%/mysql'
		]:
		privileges => ['all'],
		require => Class['::mysql::server']
	}
}