class base::ssh {
  package { 'openssh-package':
          name   => 'openssh',
          ensure => present,
  } 
  
  file { '/etc/ssh/sshd_config':
          ensure  => file ,
          owner   => 'root',
          group   => 'root',
          source  => 'puppet:///modules/base/sshd_config',
          require => Package ['openssh-package'],
  }

  service { 'sshd':
          ensure    => running,
          enable    => true,
          subscribe => File ['/etc/ssh/sshd_config'],
  }
}

