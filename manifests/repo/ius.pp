#
# = Class: yum::repo::ius
#
# This module manages IUS repo files for $lsbdistrelease
#
class yum::repo::ius (
  $stage     = 'yumsetup',
  $priority  = '61',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file {  '/etc/yum.repos.d/ius.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/ius.erb"),
    require => Package['ius-release'],
  }

  # install package depending on major version
  case $::operatingsystemrelease {
    default: {}
    /^6.*/: {
      package { 'ius-release':
        ensure   => present,
        provider => 'rpm',
        source   => 'https://centos6.iuscommunity.org/ius-release.rpm',
      }
    }
    /^7.*/: {
      package { 'ius-release':
        ensure   => present,
        provider => 'rpm',
        source   => 'https://centos7.iuscommunity.org/ius-release.rpm',
      }
    }
  }
}
