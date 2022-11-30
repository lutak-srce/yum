# Class: yum::repo::epel
#
# This module manages EPEL repo files for $lsbdistrelease
#
class yum::repo::epel (
  $priority  = '11',
  $exclude   = [],
  $include   = [],
  $baseurl   = undef,
  $debuginfo = false,
  $source    = false,
) {

  file { '/etc/yum.repos.d/epel.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/epel.erb"),
    require => Package['epel-release'],
  }

  # install package depending on major version
  package { 'epel-release':
    provider => 'rpm',
    source   => "https://dl.fedoraproject.org/pub/epel/epel-release-latest-${facts['os']['release']['major']}.noarch.rpm",
  }

}
