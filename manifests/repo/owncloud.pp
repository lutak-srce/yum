#
# = Class: yum::repo::owncloud
#
# This module manages owncloud repo files for $lsbdistrelease
#
class yum::repo::owncloud (
  $stage     = 'yumsetup',
  $priority  = '1',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
  $version   = 'production',
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
    content => template('yum/generic/ownCloud.erb'),
  }

}
