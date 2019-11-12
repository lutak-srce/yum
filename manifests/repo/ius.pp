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
  $source = false,
){
  require yum::repo::base

  file {  '/etc/yum.repos.d/ius.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${facts['os']['name']}/ius.erb"),
    require => Package['ius-release'],
  }

  # install package depending on major version
  package { 'ius-release':
    provider => 'rpm',
    source   => "http://dl.iuscommunity.org/pub/ius/stable/Redhat/${::facts['os']['release']['major']}/x86_64/ius-release-2-1.el7.ius.noarch.rpm",
  }
}
