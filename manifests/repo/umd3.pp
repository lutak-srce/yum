# Class: yum::repo::umd2
#
# This module manages UMD2 repo files
#
class yum::repo::umd3 (
  $stage   = 'yumsetup',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/UMD-3-base.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source  =>  "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/UMD-3-base.repo",
    require => Package['umd-release'],
  }
  file { '/etc/yum.repos.d/UMD-3-updates.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source  =>  "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/UMD-3-updates.repo",
    require => Package['umd-release'],
  }
  file { '/etc/yum.repos.d/EGI-trustanchors.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source  =>  "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/EGI-trustanchors.repo",
    require => Package['umd-release'],
  }

  case $::operatingsystemrelease {
    default: {}
    /^5.*/: {
      package {'umd-release':
        ensure   => '3.0.1-1.el5',
        provider => 'rpm',
        source   => 'http://repository.egi.eu/sw/production/umd/3/sl5/x86_64/updates/umd-release-3.0.1-1.el5.noarch.rpm',
      }
    }
    /^6.*/: {
      package {'umd-release':
        ensure   => '3.0.1-1.el6',
        provider => 'rpm',
        source   => 'http://repository.egi.eu/sw/production/umd/3/sl6/x86_64/updates/umd-release-3.0.1-1.el6.noarch.rpm',
      }
    }
  }
}
