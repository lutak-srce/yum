# Class: yum::repo::htcondor
#
# This module manages HTCondor repo files for $lsbdistrelease
#
class yum::repo::htcondor (
  $stage   = 'yumsetup',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/htcondor.repo' :
    ensure => file,
    mode   => '0644',
    owner  => root,
    group  => root,
    source => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/htcondor.repo",
  }
}
