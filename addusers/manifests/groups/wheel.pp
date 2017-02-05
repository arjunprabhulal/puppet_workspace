class addusers::groups::wheel {
    group { 'wheel':
      ensure  => 'present',
    }
}
