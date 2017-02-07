class profiles::base {
    include base
    include base::params
    include base::ssh
    include base::variables
    include addusers
    include addusers::groups::finance
    include addusers::groups::wheel
    class {'ntp': }
}
