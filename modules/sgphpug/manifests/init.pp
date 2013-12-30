class sgphpug
{
	yumrepo {
	    'epel':
	        descr       => 'Extra Packages for Enterprise Linux 6 - $basearch',
	        enabled     => "1",
	        gpgcheck    => "1",
	        failovermethod => 'priority',
	        gpgkey      => "http://download.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6",
	        mirrorlist  => 'https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch'
	        ;
	}
}
