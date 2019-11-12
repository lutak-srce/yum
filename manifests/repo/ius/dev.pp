# Class: yum::repo::ius::dev
#
# This module adds IUS dev repo to $lsbdistrelease
#
class yum::repo::ius::dev (
  $stage     = 'yumsetup',
  $priority  = '63',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
  $source = false,
){
  require yum::repo::ius

  file {  '/etc/yum.repos.d/ius-dev.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/ius-dev.erb"),
  }
}
