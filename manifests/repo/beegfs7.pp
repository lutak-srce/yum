#
# = Class: yum::repo::beegfs7
#
# This module manages BeeGFS repo files for $lsbdistrelease
#
class yum::repo::beegfs7 (
  $exclude = [],
  $include = [],
  $baseurl = undef,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/beegfs7.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template('yum/CentOS/beegfs7.erb'),
  }
}
