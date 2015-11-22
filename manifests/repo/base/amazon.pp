# Class: yum::repo::base::amazon
#
# This module manages Amazon base repo files for $operatingsystemrelease
#

# Amazon
class yum::repo::base::amazon (
  $stage     = 'yumsetup',
  $priority  = '10',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require ::yum::repo::base

  File {
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0644',
  }

  package { 'system-release':
    ensure => present,
  }

  file { '/etc/yum.repos.d/amzn-main.repo':
    ensure  => file,
    content => template('yum/Amazon/amzn-main.erb'),
  }

  file { '/etc/yum.repos.d/amzn-updates.repo':
    ensure  => file,
    content => template('yum/Amazon/amzn-updates.erb'),
  }

}
