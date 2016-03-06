# Class: yum::repo::pgdg93
#
# This module manages PostgreSQL 9.3 repo files for $lsbdistrelease
#
class yum::repo::pgdg93 (
  $stage   = 'yumsetup',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/pgdg-93-centos.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source  => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/pgdg-93-centos.repo",
    require => Package['pgdg-centos93'],
  }

  # install package depending on major version
  case $::operatingsystemrelease {
    default: {}
    /^5.*/: {
      package { 'pgdg-centos93' :
        ensure   => '9.3-1',
        provider => 'rpm',
        source   => 'http://yum.postgresql.org/9.3/redhat/rhel-5-i386/pgdg-centos93-9.3-1.noarch.rpm', }
    }
    /^6.*/: {
      package { 'pgdg-centos93' :
        ensure   => '9.3-1',
        provider => 'rpm',
        source   => 'http://yum.postgresql.org/9.3/redhat/rhel-6-i386/pgdg-centos93-9.3-1.noarch.rpm', }
    }
  }
}
