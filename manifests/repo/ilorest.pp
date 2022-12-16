# Class: yum::repo::ilorest
#
# This module manages HPE ilorest repo files
#
class yum::repo::ilorest {
  require ::yum::repo::base

  file { '/etc/yum.repos.d/ilorest.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source  =>  "puppet:///modules/yum/ilorest.repo",
  }
}
