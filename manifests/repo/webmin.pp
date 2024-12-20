# Class: yum::repo::webmin
#
# This module manages Webmin repo files for $lsbdistrelease
#
class yum::repo::webmin (
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require ::yum::repo::base

  exec {'webminrepokeyimport':
    command => '/bin/rpm --import http://www.webmin.com/jcameron-key.asc',
    unless  => '/bin/rpm -qa | /bin/grep -q 11f63c51',
  }

  file { '/etc/yum.repos.d/webmin.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source  =>  "puppet:///modules/yum/${facts['os']['name']}/${facts['os']['release']['full']}/webmin.repo",
    require => Exec['webminrepokeyimport'],
  }
}
