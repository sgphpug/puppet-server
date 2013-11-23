node 'sgphpug.cloudapp.net'{
    class { "sgphpug": }
    class { "sgphpug::apache": }
    class { "sgphpug::php": }
    class { "sgphpug::mysql": 
    	root_pwd => 'media1'
	}
}
