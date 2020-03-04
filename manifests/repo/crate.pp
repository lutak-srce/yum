#
# = Class: yum::repo::crate
#
# This module manages crate repo files for $lsbdistrelease
#
class yum::repo::crate (
  $priority  = '1',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
) {

  File {
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    require => Package['crate-release'],
  }

  file { '/etc/yum.repos.d/crate.repo':
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/crate.erb"),
  }

  # install package depending on major version
  case $::operatingsystemrelease {
    default: {}
    /^6.*/: {
      package { 'crate-release':
        ensure   => present,
        provider => 'rpm',
        source   => 'https://cdn.crate.io/downloads/yum/6/x86_64/crate-release-6.5-1.noarch.rpm',
      }
    }
    /^7.*/: {
      package { 'crate-release':
        ensure   => present,
        provider => 'rpm',
        source   => 'https://cdn.crate.io/downloads/yum/7/noarch/crate-release-7.0-1.noarch.rpm',
      }
    }
  }
}
