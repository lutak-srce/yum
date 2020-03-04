# Class: yum::repo::microsoft
#
# This module manages Microsoft repo files
#
class yum::repo::microsoft (
  $priority  = 99,
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file {  '/etc/yum.repos.d/microsoft-prod.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${facts['os']['name']}/microsoft-prod.erb"),
  }
}
