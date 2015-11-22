# Class: yum::repo::rsyslog
#
# This module manages rsyslog repo files for $lsbdistrelease
#
class yum::repo::rsyslog (
  $stage    = 'yumsetup',
  $priority = 1,
  $exclude  = [],
){
  require yum::repo::base

  file { '/etc/yum.repos.d/rsyslog.repo' :
    ensure => file,
    mode   => '0644',
    owner  => root,
    group  => root,
    source => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/rsyslog.repo",
  }
}
