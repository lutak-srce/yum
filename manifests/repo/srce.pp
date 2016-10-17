# Class: yum::repo::srce
#
# This module manages Srce repo files for $lsbdistrelease
#
class yum::repo::srce (
  $priority  = '5',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
) {
  file { '/etc/yum.repos.d/srce.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/srce.erb"),
    require => Package['srce-release'],
  }

  # install package depending on major version
  case $::operatingsystemrelease {
    default : { }
    /^5.*/: {
      package { 'srce-release' :
        ensure   => present,
        provider => 'rpm',
        source   => 'http://ftp.srce.hr/srce-redhat/base/el5/x86_64/srce-release-5-3.el5.srce.noarch.rpm',
      }
    }
    /^6.*/: {
      package { 'srce-release' :
        ensure   => present,
        provider => 'rpm',
        source   => 'http://ftp.srce.hr/srce-redhat/base/el6/x86_64/srce-release-5-3.el6.srce.noarch.rpm',
      }
    }
    /^7.*/: {
      package { 'srce-release' :
        ensure   => present,
        provider => 'rpm',
        source   => 'http://ftp.srce.hr/srce-redhat/base/el7/x86_64/srce-release-5-3.el7.srce.noarch.rpm',
      }
    }
  }
}
