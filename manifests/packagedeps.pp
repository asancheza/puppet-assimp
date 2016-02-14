/*
 * Manage package dependencies
 */
class packagedeps {
	# Install dependencies (cmake, gcc, g++, python..)
	package { 'cmake': ensure => 'installed' }
	package { 'gcc': ensure => 'installed' }
	package { 'g++': ensure => 'installed' }
	package { 'make': ensure => 'installed' }
	package { 'pkg-kde-tools': ensure => 'installed' }
	package { 'python': ensure => 'installed' }
	package { 'python-dev': ensure => 'installed' }
	package { 'python-pip': ensure => 'installed' }

	# Python dependency (python-dev required)
	exec { 'numpy':  
    		command => '/usr/bin/pip install numpy',
		timeout => 0,
		require => Package['python-dev']
	}
}
