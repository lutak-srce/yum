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
  case $facts['os']['release']['major'] {
    default: {}
    /^(6|7).*/: {
      package { 'percona-release':
        ensure   => present,
        provider => 'rpm',
        source   => 'https://repo.percona.com/percona/yum/release/percona-release-latest.noarch.rpm',
      }

      $repofile_path = '/etc/yum.repos.d/percona-release.repo'
    }
    /^(8|9).*/: {
      package { 'percona-release':
        ensure   => present,
        provider => 'rpm',
        source   => 'https://repo.percona.com/yum/percona-release-latest.noarch.rpm',
      }

      $repofile_path = '/etc/yum.repos.d/percona-original-release.repo'
    }
  }

  case $version {
    default: {
      file { '/etc/yum.repos.d/percona-release.repo':
        path    => $repofile_path,
        content => template('yum/generic/percona.erb'),
      }
    }
    /8(\.)?0/: {
      file { '/etc/yum.repos.d/percona-pdps-8.0-release.repo':
        content => template('yum/generic/percona-pdps-8.0-release.erb'),
      }
    }
    /8(\.)?4/: {
      file { '/etc/yum.repos.d/percona-pdps-8.4-release.repo':
        content => template('yum/generic/percona-pdps-8.4-release.erb'),
      }
    }
  }

}
