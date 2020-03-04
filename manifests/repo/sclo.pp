#
# Class: yum::repo::sclo
#
# This module manages Software collections repo files
#
class yum::repo::sclo (
  $priority  = 1,
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base::extras

  file { '/etc/yum.repos.d/CentOS-SCLo-scl.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content =>  template("yum/${::operatingsystem}/${::operatingsystemrelease}/CentOS-SCLo-scl.erb"),
    require => Package['centos-release-scl'],
  }
  file { '/etc/yum.repos.d/CentOS-SCLo-scl-rh.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content =>   template("yum/${::operatingsystem}/${::operatingsystemrelease}/CentOS-SCLo-scl-rh.erb"),
    require => Package['centos-release-scl-rh'],
  }

  case $::operatingsystemrelease {
    default: {}
    /^7.*/: {
      package {'centos-release-scl':
        ensure => present,
      }
      package {'centos-release-scl-rh':
        ensure => present,
      }
    }
  }
}
