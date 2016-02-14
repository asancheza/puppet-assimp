class dependencies {
	package { 'cmake': ensure => 'installed' }
	package { 'gcc': ensure => 'installed' }
	package { 'make': ensure => 'installed' }
	package { 'pkg-kde-tools': ensure => 'installed' }
	package { 'python': ensure => 'installed' }
}
