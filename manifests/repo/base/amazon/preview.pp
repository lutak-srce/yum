# Class: yum::repo::base::amazon::preview
#
# This module manages Amazon preview repo files for $operatingsystemrelease
#

# Amazon
class yum::repo::base::amazon::preview (
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

  file { '/etc/yum.repos.d/amzn-preview.repo':
    ensure  => file,
    content => template('yum/Amazon/amzn-preview.erb'),
  }

}
