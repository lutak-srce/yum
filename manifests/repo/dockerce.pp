#
# = Class: yum::repo::dockerce
#
# This module manages Docker Community Edition repo files for $lsbdistrelease
#
class yum::repo::dockerce (
  $stage     = 'yumsetup',
  $priority  = '61',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
  $source    = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/docker-ce.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template('yum/generic/docker-ce.erb'),
  }

}
