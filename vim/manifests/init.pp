# Class: vim
# ===========================
#
# Full description of class vim here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'vim':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class vim {

  Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }

  exec{'Cloning .vim module':
    command => 'git clone https://github.com/ricciocri/vimrc .vim',
    cwd     => '/root/',
    unless  => 'ls -lrt /root/.vim',
  }

  exec{'changing url entries from  git: to https:':
    command => "sed -i -e 's/git:/https:/g' .gitmodules",
    cwd     => '/root/.vim',
    onlyif  => 'ls -lrt /root/.vim',
  } 

  exec{'Pulling submodule in vim':
    command => 'git pull && git submodule init && git submodule update && git submodule status',
    cwd     => '/root/.vim',
    onlyif  => 'ls -lrt /root/.vim',
  }

  exec{'Deleting symlink if already exists':
    command => 'rm -rf .vimrc',
    cwd     => '/root',
    onlyif  => 'ls -lrt .vimrc',
  } 

  exec{'Creating symlink':
    command => 'ln -s .vim/.vimrc .',
    cwd     => '/root',
    unless  => 'ls -lrt .vimrc',
  }

}
