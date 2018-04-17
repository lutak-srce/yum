#
# = Class: yum::repo::pgdg10
#
# This module manages PostgreSQL 10 repo files for $lsbdistrelease
#
class yum::repo::pgdg10 (
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/pgdg-10-centos.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source  => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/pgdg-10-centos.repo",
    require => Package['pgdg-centos10'],
  }

  # install package depending on major version
  case $::operatingsystemrelease {
    default: {}
    /^6.*/: {
      package { 'pgdg-centos10' :
        provider => 'rpm',
        source   => 'https://yum.postgresql.org/10/redhat/rhel-6-x86_64/pgdg-centos10-10-2.noarch.rpm', }
    }
    /^7.*/: {
      package { 'pgdg-centos10' :
        provider => 'rpm',
        source   => 'https://yum.postgresql.org/10/redhat/rhel-7-x86_64/pgdg-centos10-10-2.noarch.rpm', }
    }
  }
}
