#
# = Class: yum::repo::beegfs
#
# This module manages BeeGFS repo files for $lsbdistrelease
#
class yum::repo::beegfs (
  $exclude = [],
  $include = [],
  $baseurl = undef,
  $version = '2015.03',
){
  require yum::repo::base

  file { '/etc/yum.repos.d/beegfs.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template('yum/CentOS/beegfs.erb'),
  }
}
