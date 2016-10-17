# Class: yum::repo::zfs::testing
#
# This module manages ZFS testing repo files for $lsbdistrelease
#
class yum::repo::zfs::testing (
  $priority  = '99',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
) {
  require yum::repo::zfs

  file { '/etc/yum.repos.d/zfs-testing.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/zfs-testing.erb"),
  }
}
