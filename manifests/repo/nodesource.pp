#
# = Class: yum::repo::nodesource
#
# This module manages nodejs repo files for $lsbdistrelease
#
class yum::repo::nodesource (
  $priority  = '99',
  $exclude   = [],
  $include   = [],
  $source    = false,
){
  require yum::repo::base

  file {"/etc/yum.repos.d/nodesource-el${facts['os']['release']['major']}.repo":
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/nodesource.erb"),
    require => Package['nodesource-release'],
  }  

  package { 'nodesource-release':
    ensure   => present,
    provider => 'rpm',
    source   => "https://rpm.nodesource.com/pub_8.x/el/${facts['os']['release']['major']}/x86_64/nodesource-release-el${facts['os']['release']['major']}-1.noarch.rpm",
  }  
}
