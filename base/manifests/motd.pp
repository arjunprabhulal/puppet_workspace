class base::motd {
    
    $author = $base::params::author

    file { '/etc/motd':
            ensure  => file,
            owner   => root,
            group  => root,
            mode    => 0644,
            content => template('base/motd.erb'),
    }
}
