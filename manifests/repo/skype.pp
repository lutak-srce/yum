#
# = Class: yum::repo::skype
#
# This module manages skype repo files for $operatingsystemrelease
#
class yum::repo::skype (
  $stage     = 'yumsetup',
  $priority  = 99,
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){

  require yum::repo::base

  file { '/etc/yum.repos.d/skype-stable.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template('yum/generic/skype-stable.erb'),
  }

}
