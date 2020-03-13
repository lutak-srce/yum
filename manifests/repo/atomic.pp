#
# = Class: yum::repo::atomic
#
# This module manages ATOMIC repo files for $operatingsystemrelease
#
class yum::repo::atomic (
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
  }

}
