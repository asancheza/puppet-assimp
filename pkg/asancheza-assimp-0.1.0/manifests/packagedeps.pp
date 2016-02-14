/*
 * Manage package dependencies
 */
class packagedeps {
	# Install dependencies (cmake, gcc, g++, python..)
	package { 'cmake': ensure => 'installed' }
	package { 'make': ensure => 'installed' }
	
	if $::osfamily == 'Ubuntu' {
		package { 'gcc': ensure => 'installed' }
		package { 'g++': ensure => 'installed' }
		package { 'pkg-kde-tools': ensure => 'installed' }
		package { 'pkg-config': ensure => 'installed' }
		package { 'libzzip-dev': ensure => 'installed' }
		package { 'libzip-dev': ensure => 'installed' }
		package { 'python': ensure => 'installed' }
		package { 'python-dev': ensure => 'installed' }
		package { 'python-pip': ensure => 'installed' }
		$python = Package['python-dev']
	} elsif $::osfamily == 'RedHat' {
		package { 'gcc-c++': ensure => 'installed' }
		package { 'zlib-devel': ensure => 'installed' }
		package { 'python': ensure => 'installed' }
		package { 'python-devel': ensure => 'installed' }
		package { 'python-pip': ensure => 'installed' }
		package { 'minizip-devel': ensure => 'installed' }
		$python = Package['python-devel']
	}

	# Python dependency (python-dev required)
	exec { 'numpy':  
    		command => '/usr/bin/pip install numpy',
		timeout => 0,
		require => $python
	}
}
