# Class: yum::repo::percona
#
# This module manages Percona repo files for $lsbdistrelease
#
class yum::repo::percona (
  $exclude   = [],
  $include   = [],
  $source    = false,
  $priority  = '1',
){
  require ::yum::repo::base

  file { '/etc/yum.repos.d/percona-release.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/generic/percona.erb"),
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
}
