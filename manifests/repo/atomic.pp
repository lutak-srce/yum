#
# = Class: yum::repo::atomic
#
# This module manages ATOMIC repo files for $operatingsystemrelease
#
class yum::repo::atomic (
  $priority  = '21',
  $exclude   = [ 'php*' ],
  $include   = [],
  $baseurl   = undef,
  $debuginfo = false,
) {
  require yum::repo::base

  File {
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    require => Package['atomic-release'],
  }

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY.art.txt':
    source => 'puppet:///modules/yum/keys/RPM-GPG-KEY.art.txt',
  }

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY.atomicorp.txt':
    source => 'puppet:///modules/yum/keys/RPM-GPG-KEY.atomicorp.txt',
  }

  file { '/etc/yum.repos.d/atomic.repo' :
    content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/atomic.erb"),
  }

  case $facts['os']['release']['full'] {
    default: {}
    /^5.*/: {
      package { 'atomic-release' :
        ensure   => present,
        provider => 'rpm',
        source   => 'http://www3.atomicorp.com/channels/atomic/centos/5/x86_64/RPMS/atomic-release-1.0-21.el5.art.noarch.rpm',
      }
    }
    /^6.*/: {
      package { 'atomic-release' :
        ensure   => present,
        provider => 'rpm',
        source   => 'http://www6.atomicorp.com/channels/atomic/centos/6/x86_64/RPMS/atomic-release-1.0-21.el6.art.noarch.rpm',
      }
    }
    /^7.*/: {
      package { 'atomic-release' :
        ensure   => present,
        provider => 'rpm',
        source   => 'http://www6.atomicorp.com/channels/atomic/centos/7/x86_64/RPMS/atomic-release-1.0-21.el7.art.noarch.rpm',
      }
    }
    /^8.*/: {
      package { 'atomic-release' :
        ensure   => present,
        provider => 'rpm',
        source   => 'https://www6.atomicorp.com/channels/atomic/centos/8/x86_64/RPMS/atomic-release-1.0-21.el8.art.noarch.rpm',
      }
    }
    /^9.*/: {
      package { 'atomic-release' :
        ensure   => present,
        provider => 'rpm',
        source   => 'https://www6.atomicorp.com/channels/atomic/centos/9/x86_64/RPMS/atomic-release-1.0-23.el9.art.noarch.rpm',
      }
    }
  }
}
