/*
 * Compile ASSIMP
 */
class compile {
  # Prepare makefiles for Assimp
  exec { 'prepare':
    command => "cmake -G 'Unix Makefiles'",
    path    => '/usr/bin/',
    cwd     => '/opt/assimp/'
  }

  # Compile assimp
  exec { 'make':
    command => 'make && make install',
    path    => '/usr/bin/',
    cwd     => '/opt/assimp/',
    timeout => 0,
    require => Exec["prepare"]
  }

  # Compile Python bindings
  exec { 'bindings':
    command => 'python setup.py install',
    path    => '/usr/bin/',
    cwd     => '/opt/assimp/port/PyAssimp/',
    timeout => 0,
    require => Exec["make"]
  }

  # Export LD_LIBRARY_PATH (default in Ubuntu is empty)
  file { "/etc/ld.so.conf.d/assimp.conf":
     ensure  => present,
     content => "/usr/local/lib/",
     mode    => 755,
     require => Exec["make"]
  }

  exec { 'ldlibcfg': 
    command => "/sbin/ldconfig",
    require => File["/etc/ld.so.conf.d/assimp.conf"]
  }

  exec { 'ln': 
    command => "ln -s /usr/local/lib/libassimp.so /lib/libassimp.so",
    path    => '/bin/',
    require => Exec["ldlibcfg"]
 }  
}
