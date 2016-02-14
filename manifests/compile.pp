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

  # Export LD_LIBRARY_PATH
  file { "/etc/ld.so.conf.d/assimp.conf":
     ensure  => present,
     content => "/usr/local/lib",
     mode    => 755
  }

  exec { 'ldlibcfg': 
    command => "/sbin/ldconfig",
  }
}
