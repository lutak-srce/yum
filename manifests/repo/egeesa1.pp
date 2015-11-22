# Class: yum::repo::egeesa1
#
# This module manages egeesa1 (SAM) repo files
#
class yum::repo::egeesa1(
  $stage     = 'yumsetup',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/sa1-centos5-release.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source  =>  "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/sa1-centos5-release.repo",
    require => Package['sa1-release'],
  }

  case $::operatingsystemrelease {
    default: {}
    /^5.*/: {
      package {'sa1-release':
        ensure   => '3-1.el5',
        provider => 'rpm',
        source   => 'http://www.sysadmin.hep.ac.uk/rpms/egee-SA1/centos5/x86_64/sa1-release-3-1.el5.noarch.rpm',
      }
    }
  }
}
