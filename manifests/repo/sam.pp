# Class: yum::repo::sam
#
# This module manages EMI SAM repo files
#
class yum::repo::sam (
  $stage   = 'yumsetup',
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
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/sam.erb"),
  }
}
