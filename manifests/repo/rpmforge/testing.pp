# Class: yum::repo::rpmforge::testing
#
# This module adds RPMForge testing repo to $lsbdistrelease
#
class yum::repo::rpmforge::testing (
  $priority  = '53',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::rpmforge

  file {  '/etc/yum.repos.d/rpmforge-testing.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/rpmforge-testing.erb"),
  }
}
