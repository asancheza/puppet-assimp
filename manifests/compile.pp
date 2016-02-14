/*
 * Compile ASSIMP
 */
class compile {
  # Prepare makefiles for Assimp
  exec { 'prepare':
    command => "cmake -G 'Unix Makefiles'",
    path    => '/usr/bin/',
    cwd     => '/opt/code/assimp'
  }

  # Compile assimp
  exec { 'make':
    command => 'make && make install',
    path    => '/usr/bin/',
    cwd     => '/opt/code/assimp'
  }

  # Compile Python bindings
  exec { 'bindings':
    command => 'python setup.py install',
    path    => '/usr/bin/',
    cwd     => '/opt/code/assimp/port/PyAssimp/' 
  }

  /*file { '/etc/ld.so.conf':
    owner   => root,
    group   => root,
    mode    => 644,
    source  => "puppet:///files/ld.so.conf",
  }

  exec { 'ldlibcfg': 
    command => "/sbin/ldconfig",
    subscribe => File["/etc/ld.so.conf"],
    refreshonly => true
  }*/

  # Export LD_LIBRARY_PATH
  exec { 'export':
    command => '/bin/bash -c "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib"',
  }
}
