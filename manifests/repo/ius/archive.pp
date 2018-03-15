# Class: yum::repo::ius::archive
#
# This module adds IUS archive repo to $lsbdistrelease
#
class yum::repo::ius::archive (
  $priority  = '61',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::ius

  file {  '/etc/yum.repos.d/ius-archive.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/ius-archive.erb"),
  }
}
