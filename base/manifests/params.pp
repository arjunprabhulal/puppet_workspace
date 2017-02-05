class base::params {

  $author = "Arjun"

  case $osfamily {
             'Redhat' : { $ssh_name = 'sshd' }
             'Debian' : { $ssh_name = 'ssh' }
              default  : { fail('OS not suported by puppet module ssh') }
   }
}


