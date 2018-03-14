# Class: yum::repo::cert
#
# This module manages cert repo files
#
class yum::repo::cert (
  $stage   = 'yumsetup',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/cert-forensics-tools.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source  =>  "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/cert-forensics-tools.repo",
    require => Package['cert-forensics-tools-release'],
  }

  case $::operatingsystemrelease {
    default: {}
    /^6.*/: {
      package {'cert-forensics-tools-release':
        ensure   => '6-11',
        provider => 'rpm',
        source   => 'https://forensics.cert.org/cert-forensics-tools-release-el6.rpm',
      }
    }
    /^7.*/: {
      package {'cert-forensics-tools-release':
        ensure   => '7-11',
        provider => 'rpm',
        source   => 'https://forensics.cert.org/cert-forensics-tools-release-el7.rpm',
      }
    }
  }
}
