#
# = Class: yum::repo::shibboleth
#
# This module manages shibboleth repo files for $lsbdistrelease
#
class yum::repo::bro(
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/bro.repo' :
    ensure => file,
    mode   => '0644',
    owner  => root,
    group  => root,
    source => "puppet:///modules/yum/${facts['os']['name']}/${facts['os']['release']['full']}/bro.repo",
  }

}
