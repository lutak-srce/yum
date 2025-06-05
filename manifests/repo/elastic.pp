#
# = Class: yum::repo::elastic
#
# This module manages elastic repo files
#
class yum::repo::elastic (
  $priority  = '99',
  $exclude   = [],
  $include   = [],
  $baseurl   = undef,
  $debuginfo = false,
  $version   = '6.x',
){
  require yum::repo::base

  file { '/etc/yum.repos.d/elastic.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${facts['os']['name']}/elastic.erb"),
  }

}
