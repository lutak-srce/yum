#
# = Class: yum::repo::pgdg94
#
# This module manages PostgreSQL 9.4 repo files
#
class yum::repo::pgdg94 (
  $stage     = 'yumsetup',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){

  require yum::repo::base

  file { '/etc/yum.repos.d/pgdg-94-centos.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source  => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/pgdg-94-centos.repo",
    require => Package['pgdg-centos94'],
  }

  case $::operatingsystemrelease {
    default : {}
    /^5.*/ : {
      package { 'pgdg-centos94' :
        ensure   => '9.4-1',
        provider => 'rpm',
        source   => 'http://yum.postgresql.org/9.4/redhat/rhel-5-i386/pgdg-centos94-9.4-1.noarch.rpm', }
    }
    /^6.*/ : {
      package { 'pgdg-centos94' :
        ensure   => '9.4-1',
        provider => 'rpm',
        source   => 'http://yum.postgresql.org/9.4/redhat/rhel-6-i386/pgdg-centos94-9.4-1.noarch.rpm', }
    }
  }

}
