node 'sgphpug.cloudapp.net'{
    class { "sgphpug": }
    class { "sgphpug::apache": }
    class { "sgphpug::php": }
    class { "sgphpug::mysql": }

	sgphpug::user{ "miccheng":
		public_key => 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAxRRDYFyVZ9oJDag2FBuxL9MzSVXSzJh/vT8KSEF6KYUvjPW257lK+iIWeK0x5yAHZ1OetJ9s0nYZRIfkLkf1HlJMrRRYgaZRKZuzlqmE00ozP6LHPSW4DaxPT+NElnUYoznlgCCM9A+A4ZNdOUgBHXc44qY0QdmDRQBTgS5JLEoSafa6o3MU3gvTPwK7POVxFtm+pmfix4OOxqNN0S/qoHMCfKwrp4737CEpJgqE6cgopNkG9pnFC90ZgYK/bbpD24KKRNf/aXhJsKEU+81c4WL88P6vZR3NIioNhqjgpqFFryXNc6P0F47XpFjdz9L2kvu4GuVQxEeHyV78ozxrfw== miccheng@miccheng-laptop'
	}
	sgphpug::user{ "sam":
		public_key => 'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAmKHXneslzeZQmueuMALCM5WXii2uxlU5cb+TxeQ0aTJftWM4sD2AXXgQ7Jhtf3X/byhdrVsbWyB5pZ3NcfDWUEBnQWsZ3BVahapGed0Knxxbf0201NBwZ/ViisTMyCKmH6+Eb4k4j8Ox44ItkZXeg3L5seWx3/ibjjeBWCxijsqiPCSEghKtmoTmXNC4aaGmyNk3eabcRNkH0uViaH4mDukwapynqRreRh7Hb35aTotPRZkm2cfq2DnvkUIDgx8ncksmKfHJBPZXWuLTw2AZBC152QAd8HkO9DCSvUrZnJkv6Qvy5nzacFekqIpwg58nqcCDbn2nLzB7sMcQSueWow== puppy'
	}
	sgphpug::user{ "uzyn": }
	sgphpug::user{ "laurence": }
}
