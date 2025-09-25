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

  # install package depending on major version
  case $facts['os']['release']['full'] {
    /^10.*/: {
      $srcerelease = '6-0'
      file { '/etc/yum.repos.d/srce.repo' :
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template('yum/Rocky/10/srce.erb'),
        require => Package['srce-release'],
      }
    }
    default: {
      $srcerelease = '5-3'
      file { '/etc/yum.repos.d/srce.repo' :
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template('yum/CentOS/srce.erb'),
        require => Package['srce-release'],
      }
    }
  }
  package { 'srce-release' :
    ensure   => present,
    provider => 'rpm',
    source   => "http://ftp.srce.hr/srce-redhat/base/el${facts['os']['release']['major']}/x86_64/srce-release-${srcerelease}.el${facts['os']['release']['major']}.srce.noarch.rpm",
  }
}
