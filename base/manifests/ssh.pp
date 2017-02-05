class base::ssh {
  package { 'openssh-package':
          name   => 'openssh-server',
          ensure => present,
  } 
  
  file { '/etc/ssh/sshd_config':
          ensure  => file ,
          owner   => 'root',
          group   => 'root',
          source  => 'puppet:///modules/base/sshd_config',
          require => Package ['openssh-package'],
          notify  => Service ['ssh-service'],
  }

  service { 'ssh-service':
          name   => $base::params::ssh_name,
          ensure => running,
          enable => true,
  }
}

