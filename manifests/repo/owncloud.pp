#
# = Class: yum::repo::owncloud
#
# This module manages owncloud repo files for $lsbdistrelease
#
class yum::repo::owncloud (
  $stage     = 'yumsetup',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  File {
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
  }

  file { "/etc/yum.repos.d/ownCloud_ce:${version}.repo":
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/ownCloud.erb"),
  }

}
