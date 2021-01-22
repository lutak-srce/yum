#
# = Class: yum::repo::ius::testing
#
# This module adds IUS testing repo to $lsbdistrelease
#
class yum::repo::ius::testing (
  $priority  = '62',
  $exclude   = [],
  $include   = [],
  $baseurl   = undef,
  $debuginfo = false,
){
  require yum::repo::ius

  file {  '/etc/yum.repos.d/ius-testing.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${facts['os']['name']}/ius-testing.erb"),
  }
}
