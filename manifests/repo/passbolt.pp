#
# = Class: yum::repo::passbolt
#
# This module manages passbolt repo files for $lsbdistrelease
#
class yum::repo::passbolt (
  $priority = '1',
  $exclude  = [],
  $include  = [],
  $baseurl  = undef,
){

  require yum::repo::base

  file { '/etc/yum.repos.d/passbolt.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/generic/passbolt.erb"),
  }

}
