/*
 * Git clone using vcsrepo latest stable v3.1.1
 */
class clone ($username='asancheza') {
    $group = $username
    group { $username:
        ensure  => present,
        gid     => 2000,
    }

    user { $username:
        ensure  => present,
        gid     => $group,
        require => Group[$group],
        uid     => 2000,
        home    => "/home/${username}",
        shell   => "/bin/bash",
        managehome  => true,
    }

    file { '/opt/' :
        ensure  => directory,
        group   => $group,
        owner   => $username,
        mode    => 0755,
    }

    file { '/home/${username}':
        ensure  => directory,
        group   => $group,
        owner   => $username,
        mode    => 0700,
    }

    package { 'git':
        ensure => installed,
    }
    
    vcsrepo { "/opt/assimp":
        ensure   => latest,
        owner    => $owner,
        group    => $owner,
        provider => git,
        require  => [ Package["git"] ],
        source   => "https://github.com/assimp/assimp.git",
        revision => 'v3.1.1',
    }

    # Run apt-get update to be sure system is updated
    exec { 'apt-update':
    	command     => '/usr/bin/apt-get update',
    }
}
