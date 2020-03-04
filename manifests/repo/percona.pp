# Class: yum::repo::percona
#
# This module manages Percona repo files for $lsbdistrelease
#
class yum::repo::percona (
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
  $priority  = '1',
){
  require ::yum::repo::base

  file { '/etc/yum.repos.d/Percona.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/percona.erb"),
    require => Package['percona-release'],
  }

  # install package depending on major version
  case $::operatingsystemrelease {
    default: {}
    /^6.*/: {
      package { 'percona-release':
        ensure   => present,
        provider => 'rpm',
        source   => 'http://www.percona.com/downloads/percona-release/percona-release-0.0-1.x86_64.rpm',
      }
    }
  }
}
