# Class: yum::repo::jpackage
#
# This module manages JPackage repo files for $lsbdistrelease
#
class yum::repo::jpackage (
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
  $priority  = '10',
){
  require ::yum::repo::base

  file { '/etc/yum.repos.d/jpackage.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/jpackage.erb"),
    require => Package['jpackage-release'],
  }

  # install package depending on major version
  case $::operatingsystemrelease {
    default: {}
    /^6.*/: {
      package { 'jpackage-release':
        ensure   => present,
        provider => 'rpm',
        source   => 'http://mirrors.dotsrc.org/jpackage/6.0/generic/free/RPMS/jpackage-release-6-3.jpp6.noarch.rpm',
      }
    }
  }
}
