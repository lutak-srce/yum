# Class: yum::repo::pgdg95
#
# This module manages PostgreSQL 9.5 repo files for $lsbdistrelease
#
class yum::repo::pgdg95 (
  $stage   = 'yumsetup',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/pgdg-95-centos.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source  => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/pgdg-95-centos.repo",
    require => Package['pgdg-centos95'],
  }

  # install package depending on major version
  case $::operatingsystemrelease {
    default: {}
    /^6.*/: {
      package { 'pgdg-centos95' :
        ensure   => '9.5-3',
        provider => 'rpm',
        source   => 'http://yum.postgresql.org/9.5/redhat/rhel-6-x86_64/pgdg-centos95-9.5-3.noarch.rpm', }
    }
    /^7.*/: {
      package { 'pgdg-centos95' :
        ensure   => '9.5-3',
        provider => 'rpm',
        source   => 'http://yum.postgresql.org/9.5/redhat/rhel-7-x86_64/pgdg-centos95-9.5-3.noarch.rpm', }
    }
  }
}
