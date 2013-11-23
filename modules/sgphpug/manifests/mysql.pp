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

	class { '::mysql::server':
		root_password    => $root_pwd,
		override_options => {
			'mysqld' => {
				'bind_address' => '0.0.0.0',
				'lower_case_table_names' => '1'
			}
		},
	}
}