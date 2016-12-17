#
# = Class: yum::repo::pgdg96
#
# This module manages PostgreSQL 9.3 repo files for $lsbdistrelease
#
class yum::repo::pgdg96 (
  $stage   = 'yumsetup',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/pgdg-96-centos.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source  => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/pgdg-96-centos.repo",
    require => Package['pgdg-centos96'],
  }

  # install package depending on major version
  case $::operatingsystemrelease {
    default: {}
    /^5.*/: {
      package { 'pgdg-centos96' :
        provider => 'rpm',
        source   => 'http://yum.postgresql.org/9.6/redhat/rhel-5-x86_64/pgdg-centos96-9.6-3.noarch.rpm', }
    }
    /^6.*/: {
      package { 'pgdg-centos96' :
        provider => 'rpm',
        source   => 'http://yum.postgresql.org/9.6/redhat/rhel-6-x86_64/pgdg-centos96-9.6-3.noarch.rpm', }
    }
    /^7.*/: {
      package { 'pgdg-centos96' :
        provider => 'rpm',
        source   => 'http://yum.postgresql.org/9.6/redhat/rhel-7-x86_64/pgdg-centos96-9.6-3.noarch.rpm', }
    }
  }
}
