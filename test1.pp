package { "openssh-server":	ensure => "installed" }

service { "sshd":		ensure => "running",
				enable => "true",
				require => Package["openssh-server"]
}

augeas { "sshd_config":
	changes => [
		"set /files/etc/ssh/sshd_config/PermitRootLogin yes"
	],
	notify => Service["sshd"]
}
