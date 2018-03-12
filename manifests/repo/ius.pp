#
# = Class: yum::repo::ius
#
# This module manages IUS repo files for $lsbdistrelease
#
class yum::repo::ius (
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
  package { 'ius-release':
    provider => 'rpm',
    source   => "https://centos${::facts['os']['release']['major']}.iuscommunity.org/ius-release.rpm",
  }
}
