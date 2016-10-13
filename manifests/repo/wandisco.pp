# Class: yum::repo::wandisco
#
# This module manages Wandisco repo files for $lsbdistrelease
# Repo serves SVN 1.7
#
class yum::repo::wandisco (
  $stage     = 'yumsetup',
  $priority  = '1',
  $version  = '1.8',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
) {
  require yum::repo::base

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-WANdisco':
    ensure => file,
    mode   => '0644',
    owner  => root,
    group  => root,
    source => 'puppet:///modules/yum/keys/RPM-GPG-KEY-WANdisco',
  }
  file { "/etc/yum.repos.d/WANdisco-${version}.repo":
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/wandisco.erb"),
    require => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-WANdisco'],
  }
}
