# Class: yum::repo::atomic
#
# This module manages ATOMIC repo files for $operatingsystemrelease
#
class yum::repo::atomic (
  $stage     = 'yumsetup',
  $priority  = '21',
  $exclude   = [ 'php*' ],
  $include   = [],
  $debuginfo = false,
) {
  require yum::repo::base

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY.art.txt':
    ensure => file,
    mode   => '0644',
    owner  => root,
    group  => root,
    source => 'puppet:///modules/yum/keys/RPM-GPG-KEY.art.txt',
  }
  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY.atomicorp.txt':
    ensure => file,
    mode   => '0644',
    owner  => root,
    group  => root,
    source => 'puppet:///modules/yum/keys/RPM-GPG-KEY.atomicorp.txt',
  }
  file { '/etc/yum.repos.d/atomic.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/atomic.erb"),
    require => Package['atomic-release'],
  }

  case $::operatingsystemrelease {
    default: {}
    /^5.*/: {
      package { 'atomic-release' :
        ensure   => '1.0-21.el5.art',
        provider => 'rpm',
        source   => 'http://www3.atomicorp.com/channels/atomic/centos/5/x86_64/RPMS/atomic-release-1.0-21.el5.art.noarch.rpm',
      }
    }
    /^6.*/: {
      package { 'atomic-release' :
        ensure   => '1.0-21.el6.art',
        provider => 'rpm',
        source   => 'http://www6.atomicorp.com/channels/atomic/centos/6/x86_64/RPMS/atomic-release-1.0-21.el6.art.noarch.rpm',
      }
    }
    /^7.*/: {
      package { 'atomic-release' :
        ensure   => '1.0-20.el7.art',
        provider => 'rpm',
        source   => 'http://www6.atomicorp.com/channels/atomic/centos/7/x86_64/RPMS/atomic-release-1.0-20.el7.art.noarch.rpm',
      }
    }
  }
}
