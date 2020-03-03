#
# = Class: yum::repo::elastic
#
# This module manages elastic repo files
#
class yum::repo::elastic (
  $stage     = 'yumsetup',
  $priority  = '99',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
  $version   = '5.x',
){
  require yum::repo::base

  file { '/etc/yum.repos.d/elastic.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/elastic.erb"),
  }

}