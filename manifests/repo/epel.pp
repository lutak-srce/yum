# Class: yum::repo::epel
#
# This module manages EPEL repo files for $lsbdistrelease
#
class yum::repo::epel (
  $stage     = 'yumsetup',
  $priority  = '11',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
  $source    = false,
) {
  file { '/etc/yum.repos.d/epel.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/epel.erb"),
    require => Package['epel-release'],
  }

  # install package depending on major version
  case $::operatingsystemrelease {
    default: {}
    /^5.*/: {
      package { 'epel-release':
        ensure   => present,
        provider => 'rpm',
        source   => 'http://archives.fedoraproject.org/pub/archive/epel/epel-release-latest-5.noarch.rpm',
      }
    }
    /^6.*/: {
      package { 'epel-release':
        ensure   => present,
        provider => 'rpm',
        source   => 'https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm',
      }
    }
    /^7.*/: {
      package { 'epel-release':
        ensure   => present,
        provider => 'rpm',
        source   => 'https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm',
      }
    }
  }
}
