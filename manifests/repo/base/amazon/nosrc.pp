# Class: yum::repo::base::amazon::nosrc
#
# This module manages Amazon nosrc repo files for $operatingsystemrelease
#

# Amazon
class yum::repo::base::amazon::nosrc (
  $stage     = 'yumsetup',
  $priority  = '10',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require ::yum::repo::base::amazon

  File {
    owner  => root,
    group  => root,
    mode   => '0644',
  }

  file { '/etc/yum.repos.d/amzn-nosrc.repo':
    ensure  => file,
    content => template('yum/Amazon/amzn-nosrc.erb'),
  }

}
