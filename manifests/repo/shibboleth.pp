# Class: yum::repo::shibboleth
#
# This module manages shibboleth repo files for $lsbdistrelease
#
class yum::repo::shibboleth(
  $stage   = 'yumsetup',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/security:shibboleth.repo' :
    ensure => file,
    mode   => '0644',
    owner  => root,
    group  => root,
    source => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/security.shibboleth.repo",
  }
}
