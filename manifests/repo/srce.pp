#
# = Class: yum::repo::srce
#
# This module manages Srce repo files for $lsbdistrelease
#
class yum::repo::srce (
  $priority  = '5',
  $exclude   = [],
  $include   = [],
  $baseurl   = undef,
  $debuginfo = false,
) {

  file { '/etc/yum.repos.d/srce.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template('yum/CentOS/srce.erb'),
    require => Package['srce-release'],
  }

  # install package depending on major version
  package { 'srce-release' :
    ensure   => present,
    provider => 'rpm',
    source   => "http://ftp.srce.hr/srce-redhat/base/el${facts['os']['release']['major']}/x86_64/srce-release-5-3.el${facts['os']['release']['major']}.srce.noarch.rpm",
  }
}
