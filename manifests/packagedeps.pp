class packagedeps {
	exec { 'apt-get-update':  
    		command     => '/usr/bin/apt-get update',
    		refreshonly => true,
	}

	package { 'cmake': ensure => 'installed' }
	package { 'gcc': ensure => 'installed' }
	package { 'g++': ensure => 'installed' }
	package { 'make': ensure => 'installed' }
	package { 'pkg-kde-tools': ensure => 'installed' }
	package { 'python': ensure => 'installed' }
}
