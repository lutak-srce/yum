#
# = Class: yum::repo::ius
#
# This module manages IUS repo files for $lsbdistrelease
#
class yum::repo::ius (
  $priority  = '61',
  $exclude   = [],
  $include   = [],
  $baseurl   = undef,
  $debuginfo = false,
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
    source   => "https://repo.ius.io/ius-release-el${::facts['os']['release']['major']}.rpm",
  }
}
