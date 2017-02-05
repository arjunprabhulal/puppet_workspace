class base::variables {

      file { '/root/variable_file':
        content => $topscope,
        owner   => root,
        group   => root,
        mode    => 0644,

      }

      $local_variable = "Local variable"
      $topscope = "New Top Scope Value"
      $nodescope = "New Node SCOPE variable"

      notify { "${topscope} is your TOP Scope": }
      notify { "${nodescope} is your NODE SCOPE": }
      notify { "${local_variable} is your LOCAL SCOPE " : }
      notify { "${::operatingsystem} is your Operating System":}

}
