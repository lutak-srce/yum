# = Class: yum::repo::remi
#
# This module manages Remi repo files for $lsbdistrelease
#
class yum::repo::remi (
  $stage     = 'yumsetup',
  $priority  = '91',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
) {
  file { '/etc/yum.repos.d/remi.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/remi.erb"),
    require => Package['remi-release'],
  }

  # install package depending on major version
  case $::operatingsystemrelease {
    default: {}
    /^5.*/: {
      package { 'remi-release':
        ensure   => present,
        provider => 'rpm',
        source   => 'http://rpms.famillecollet.com/enterprise/remi-release-5.rpm',
      }
    }
    /^6.*/: {
      package { 'remi-release':
        ensure   => present,
        provider => 'rpm',
        source   => 'http://rpms.famillecollet.com/enterprise/remi-release-6.rpm',
      }
    }
  }
}
