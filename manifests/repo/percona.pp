# Class: yum::repo::percona
#
# This module manages Percona repo files for $lsbdistrelease
#
class yum::repo::percona (
  $stage     = 'yumsetup',
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
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/percona.erb"),
    require => Package['percona-release'],
  }

  # install package depending on major version
  case $::operatingsystemrelease {
    default: {}
    /^(6|7).*/: {
      package { 'percona-release':
        ensure   => present,
        provider => 'rpm',
        source   => 'https://www.percona.com/redir/downloads/percona-release/redhat/0.1-3/percona-release-0.1-3.noarch.rpm',
      }
    }
  }
}
