#
# = Class: yum::repo::percona::testing
#
# This module manages ElRrepo Extras repo files for $operatingsystemrelease
#
class yum::repo::percona::testing (
  $exclude   = [],
  $include   = [],
  $source    = false,
  $priority  = '1',
){
  require ::yum::repo::percona

  case $::operatingsystem {
    default : {}
    'CentOS' : {
      file { '/etc/yum.repos.d/percona-release-testing.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/percona-testing.erb"),
      }
    }
  }
}
