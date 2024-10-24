#
# = Class: yum::repo::nordugrid
#
# This module manages NorduGrid repo files
#
class yum::repo::nordugrid (
  $priority  = 1,
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
  $version   = 6,
){

  require yum::repo::base

  if ($version == 7) {
    r9_source = 'https://download.nordugrid.org/packages/nordugrid-release/testing/7rc1/rocky/9/x86_64/nordugrid-release-7-0.rc1.el9.noarch.rpm'
  } else {
    r9_source = 'https://download.nordugrid.org/packages/nordugrid-release/releases/6/rocky/9/x86_64/nordugrid-release-6-1.el9.noarch.rpm'
  }

  file { '/etc/yum.repos.d/nordugrid.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/nordugrid.erb"),
    require => Package['nordugrid-release'],
  }

  file { '/etc/yum.repos.d/nordugrid-updates.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/nordugrid-updates.erb"),
    require => Package['nordugrid-release'],
  }

  case $::operatingsystemrelease {
    default: {}
    /^6.*/: {
      package {'nordugrid-release':
        ensure   => present,
        provider => 'rpm',
        source   => 'https://download.nordugrid.org/packages/nordugrid-release/releases/6/centos/el6/x86_64/nordugrid-release-6-1.el6.noarch.rpm',
      }
    }
    /^7.*/: {
      package {'nordugrid-release':
        ensure   => present,
        provider => 'rpm',
        source   => 'https://download.nordugrid.org/packages/nordugrid-release/releases/6/centos/el7/x86_64/nordugrid-release-6-1.el7.noarch.rpm',
      }
    }
    /^8.*/: {
      package {'nordugrid-release':
        ensure   => present,
        provider => 'rpm',
        source   => 'https://download.nordugrid.org/packages/nordugrid-release/releases/6/centos/el8/x86_64/nordugrid-release-6-1.el8.noarch.rpm',
      }
    }
    /^9.*/: {
      package {'nordugrid-release':
        ensure   => present,
        provider => 'rpm',
        source   => $r9_source,
      }
    }
  }
}
