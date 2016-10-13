# Class: yum::repo::epel::bacula
#
# This module manages EPEL bacula repo files for $lsbdistrelease
#
class yum::repo::epel::bacula (
  $stage     = 'yumsetup',
  $priority  = '12',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
) {
  require yum::repo::epel

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-slaanesh':
    ensure => file,
    mode   => '0644',
    owner  => root,
    group  => root,
    source => 'puppet:///modules/yum/keys/RPM-GPG-KEY-slaanesh',
  }

  file { '/etc/yum.repos.d/epel-bacula.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/epel-bacula.erb"),
  }
}
