class assimp::dependencies {
	$assimpdeps = [ 'cmake', 'make', 'gcc', 'pkg-kde-tools' ]
	package { $assimpdeps: ensure => 'installed' }
}