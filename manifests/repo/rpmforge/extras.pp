# Class: yum::repo::rpmforge::extras
#
# This module adds RPMForge extras repo to $lsbdistrelease
#
class yum::repo::rpmforge::extras (
  $priority  = '53',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::rpmforge

  file {  '/etc/yum.repos.d/rpmforge-extras.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/rpmforge-extras.erb"),
  }
}
