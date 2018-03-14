# Class: yum::repo::nordugrid
#
# This module manages nordugrid repo files
#
class yum::repo::nordugrid (
  $stage     = 'yumsetup',
  $priority  = 1,
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/nordugrid.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content =>  template("yum/${::operatingsystem}/${::operatingsystemrelease}/nordugrid.erb"),
    require => Package['nordugrid-release'],
  }
  file { '/etc/yum.repos.d/nordugrid-updates.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content =>   template("yum/${::operatingsystem}/${::operatingsystemrelease}/nordugrid-updates.erb"),
    require => Package['nordugrid-release'],
  }
  case $::operatingsystemrelease {
    default: {}
    /^6.*/: {
      package {'nordugrid-release':
        ensure   => '15.03-1.el6',
        provider => 'rpm',
        source   => 'http://download.nordugrid.org/packages/nordugrid-release/releases/15.03/centos/el6/x86_64/nordugrid-release-15.03-1.el6.noarch.rpm',
      }
    }
  }
}
