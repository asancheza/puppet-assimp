class assimp::exec {
  exec { 'prepare':
    command => 'cmake -G 'Unix Makefiles',
    path    => '/usr/local/bin/:/bin/',
    cwd     => '/opt/code/assimp'
  }

  exec { 'make':
    command => 'make && make install',
    path    => '/usr/local/bin/:/bin/',
    cwd     => '/opt/code/assimp'
  }

  exec { 'bindings':
    command => 'python setup.py install',
    path    => '/usr/local/bin/:/bin/',
    cwd     => '/opt/code/assimp/port/PyAssimp/' 
  }

  file { '/etc/ld.so.conf':
    owner   => root,
    group   => root,
    mode    => 644,
    source  => "puppet:///files/ld.so.conf",
  }

  exec { 'ldlibcfg': 
    command => "/sbin/ldconfig",
    subscribe => File["/etc/ld.so.conf"],
    refreshonly => true
	}
}