/*
 * Main manifest: Clone, get dependencies and compile
 */
class puppet-assimp {
	class { 'clone': }
	class { 'packagedeps': }
	class { 'compile': }

	Class['clone'] -> Class['packagedeps'] -> Class['compile']
}
