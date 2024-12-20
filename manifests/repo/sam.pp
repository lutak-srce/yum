# Class: yum::repo::sam
#
# This module manages EMI SAM repo files
#
class yum::repo::sam (
  $priority  = '10',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/sam.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/sam.erb"),
  }
}
