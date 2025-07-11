# Class: yum::repo::emi2
#
# This module manages EMI2 repo files
#
class yum::repo::emi2 (
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/emi2-base.repo' :
    ensure => file,
    mode   => '0644',
    owner  => root,
    group  => root,
    source => "puppet:///modules/yum/${facts['os']['name']}/${facts['os']['release']['full']}/emi2-base.repo",
  }
}
