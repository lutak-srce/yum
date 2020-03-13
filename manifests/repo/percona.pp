#
# = Class: yum::repo::percona
#
# This module manages Percona repo files for $lsbdistrelease
#
class yum::repo::percona (
  $exclude   = [],
  $include   = [],
  $source    = false,
  $priority  = '1',
  $version   = 'original',
){
  require ::yum::repo::base

  File {
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    require => Package['percona-release'],
  }

  # install package depending on major version
  case $::operatingsystemrelease {
    default: {}
    /^(6|7).*/: {
      package { 'percona-release':
        ensure   => present,
        provider => 'rpm',
        source   => 'http://repo.percona.com/percona/yum/release/percona-release-latest.noarch.rpm',
      }
    }
  }

  case $version {
    default: {
      file { '/etc/yum.repos.d/percona-release.repo':
        content => template('yum/generic/percona.erb'),
      }
    }
    /8(\.)?0/: {
      file { '/etc/yum.repos.d/percona-tools-release.rep.repo':
        content => template('yum/generic/percona-tools-release.erb'),
      }
      file { '/etc/yum.repos.d/percona-ps-80-release.repo':
        content => template('yum/generic/percona-ps-80-release.erb'),
      }
    }
  }

}
