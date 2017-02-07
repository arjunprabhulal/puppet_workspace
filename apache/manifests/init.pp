class apache {
    package { 'httpd':
          ensure => present,
    }
}
