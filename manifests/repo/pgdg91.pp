# Class: yum::repo::pgdg91
#
# This module manages PostgreSQL 9.1 repo files for $lsbdistrelease
#
class yum::repo::pgdg91 (
  $stage   = 'yumsetup',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/pgdg-91-centos.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source  => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/pgdg-91-centos.repo",
    require => Package['pgdg-centos91'],
  }

  # install package depending on major version
  case $::operatingsystemrelease {
    default: {}
    /^5.*/: {
      package { 'pgdg-centos91' :
        ensure   => '9.1-4',
        provider => 'rpm',
        source   => 'http://yum.postgresql.org/9.1/redhat/rhel-5-i386/pgdg-centos91-9.1-4.noarch.rpm', }
    }
    /^6.*/: {
      package { 'pgdg-centos91' :
        ensure   => '9.1-4',
        provider => 'rpm',
        source   => 'http://yum.postgresql.org/9.1/redhat/rhel-6-i386/pgdg-centos91-9.1-4.noarch.rpm', }
    }
  }
}
