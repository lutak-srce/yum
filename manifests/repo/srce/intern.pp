# Class: yum::repo::srce::intern
#
# This module manages srce_intern repo files for $lsbdistrelease
#
class yum::repo::srce::intern (
  $stage   = 'yumsetup',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
) {
  include ::yum::repo::srce

  file { '/etc/yum.repos.d/srce-intern.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source  => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/srce-intern.repo",
    require => Package['srce-release-intern'],
  }

  # install package depending on major version
  case $::operatingsystemrelease {
    default : { }
    /^5.*/: {
      package { 'srce-release-intern' :
        ensure   => '5-3.el5.srce',
        provider => 'rpm',
        source   => 'http://ftp.srce.hr/srce-redhat/base/el5/x86_64/srce-release-intern-5-3.el5.srce.noarch.rpm',
        require  => Package['srce-release'],
      }
    }
    /^6.*/: {
      package { 'srce-release-intern' :
        ensure   => '5-3.el6.srce',
        provider => 'rpm',
        source   => 'http://ftp.srce.hr/srce-redhat/base/el6/x86_64/srce-release-intern-5-3.el6.srce.noarch.rpm',
        require  => Package['srce-release'],
      }
    }
    /^7.*/: {
      package { 'srce-release-intern' :
        ensure   => '5-3.el7.srce',
        provider => 'rpm',
        source   => 'http://ftp.srce.hr/srce-redhat/base/el7/x86_64/srce-release-intern-5-3.el7.srce.noarch.rpm',
        require  => Package['srce-release'],
      }
    }
    /^18.*/: {
      package { 'srce-release-intern' :
        ensure   => '5-3.el6.srce',
        provider => 'rpm',
        source   => 'http://ftp.srce.hr/srce-redhat/base/el6/x86_64/srce-release-intern-5-3.el6.srce.noarch.rpm',
        require  => Package['srce-release'],
      }
    }
  }
}
