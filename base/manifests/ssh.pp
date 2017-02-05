class base::ssh {
  case $osfamily {
       'Redhat' : { $ssh_name = 'sshd' }
       'Debian' : { $ssh_name = 'ssh' }
       default  : { fail('OS not suported by puppet module ssh') }
  }


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
          notify  => Service ['ssh-service-name-two'],
  }

  service { 'ssh-service':
          name   => $ssh_name,
          ensure => running,
          alias  => 'ssh-service-name-two',
          enable => true,
  }
}

