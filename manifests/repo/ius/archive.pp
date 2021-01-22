#
# = Class: yum::repo::ius::archive
#
# This module adds IUS archive repo to $lsbdistrelease
#
class yum::repo::ius::archive (
  $priority  = '61',
  $exclude   = [],
  $include   = [],
  $baseurl   = undef,
  $debuginfo = false,
){
  require yum::repo::ius

  file {  '/etc/yum.repos.d/ius-archive.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${facts['os']['name']}/ius-archive.erb"),
  }
}
