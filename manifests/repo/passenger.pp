# Class: yum::repo::passenger
#
# This module manages Passenger repo files for $lsbdistrelease
# https://www.phusionpassenger.com/native_packages
#
class yum::repo::passenger (
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/passenger.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source  => "puppet:///modules/yum/${facts['os']['name']}/${facts['os']['release']['full']}/passenger.repo",
    require => Package['passenger-release'],
  }

  # install package depending on major version
  case $facts['os']['release']['full'] {
    default : { }
    /^5.*/: {
      package { 'passenger-release' :
        ensure   => present,
        provider => 'rpm',
        source   => 'http://passenger.stealthymonkeys.com/rhel/5/passenger-release.noarch.rpm',
      }
    }
    /^6.*/: {
      package { 'passenger-release' :
        ensure   => present,
        provider => 'rpm',
        source   => 'http://passenger.stealthymonkeys.com/rhel/6/passenger-release.noarch.rpm',
      }
    }
  }
}
