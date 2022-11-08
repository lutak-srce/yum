#
# = Class: yum::repo::td
#
# This module manages TreasureData repo files for $lsbdistrelease
#
class yum::repo::td (
  $priority = '1',
  $exclude  = [],
  $include  = [],
  $baseurl  = undef,
) {

  File {
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
  }

  file { '/etc/yum.repos.d/td.repo':
    content => template('yum/generic/td.erb'),
  }

}
