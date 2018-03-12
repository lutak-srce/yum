# Class: yum::repo::virtualbox
#
# This module manages VirtualBox repo files for $lsbdistrelease
#
class yum::repo::virtualbox (
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
) {

  exec {'vboxrepokeyimport':
    command => '/bin/rpm --import http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc',
    unless  => 'rpm -qa | grep 98ab5139 > /dev/null',
    path    => '/bin',
  }

  file { '/etc/yum.repos.d/virtualbox.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source  => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/virtualbox.repo",
    require => Exec['vboxrepokeyimport'],
  }

}
