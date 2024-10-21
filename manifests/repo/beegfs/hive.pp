#
# = Class: yum::repo::beegfs::hive
#
# This module manages BeeGFS Hive repo files for $lsbdistrelease
#
class yum::repo::beegfs::hive (
  $exclude = [],
  $include = [],
  $baseurl = undef,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/beegfs-hive.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template('yum/CentOS/beegfs-hive.erb'),
  }
}
