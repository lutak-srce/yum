# Class: yum::repo::devtoolset
#
# This module manages CERN devtoolset repo files for $lsbdistrelease
#
class yum::repo::devtoolset(
  $stage     = 'yumsetup',
  $priority  = 1,
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/devtoolset.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/devtoolset.erb"),
  }
}
