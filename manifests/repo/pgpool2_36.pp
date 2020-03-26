#
# = Class: yum::repo::pgpool2_36
#
# This module manages Pgpool 2.36 repo files
#
class yum::repo::pgpool2_36 (
  $priority  = '21',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
) {

  require yum::repo::base

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-PGPOOL2' :
    ensure => file,
    mode   => '0644',
    owner  => root,
    group  => root,
    source => 'puppet:///modules/yum/keys/RPM-GPG-KEY-PGPOOL2',
  }

  file { '/etc/yum.repos.d/pgpool-II-release-36.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/pgpool2_36.erb"),
  }

}
