#
# = Class: yum::repo::microsoft::code
#
# This module manages Microsoft code repo files
#
class yum::repo::microsoft::code (
  $priority  = 99,
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file {  '/etc/yum.repos.d/microsoft-code.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${facts['os']['name']}/microsoft-code.erb"),
  }
}
