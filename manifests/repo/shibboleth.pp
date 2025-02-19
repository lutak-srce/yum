#
# = Class: yum::repo::shibboleth
#
# This module manages shibboleth repo files for $lsbdistrelease
#
class yum::repo::shibboleth(
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/security.shibboleth.repo' :
    ensure => file,
    mode   => '0644',
    owner  => root,
    group  => root,
    source => "puppet:///modules/yum/${facts['os']['name']}/${facts['os']['release']['full']}/security.shibboleth.repo",
  }
}
