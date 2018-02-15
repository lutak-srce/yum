#
# = Class: yum::repo::elrepo
#
# This module manages elrepo repo files for $operatingsystemrelease
#
class yum::repo::elrepo (
  $stage     = 'yumsetup',
  $priority  = '99',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/elrepo.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/elrepo.erb"),
    require => Package['elrepo-release'],
  }

  case $::operatingsystemrelease {
    default: {}
    /^6.*/: {
      package { 'elrepo-release' :
        ensure   => present,
        provider => 'rpm',
        source   => 'http://elrepo.org/elrepo-release-6-8.el6.elrepo.noarch.rpm',
      }
    }
    /^7.*/: {
      package { 'elrepo-release' :
        ensure   => present,
        provider => 'rpm',
        source   => 'http://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm',
      }
    }
  }
}
