#
# = Class: yum::repo::virtualbox
#
# This module manages VirtualBox repo files for $lsbdistrelease
#
class yum::repo::virtualbox (
  $exclude = [],
  $include = [],
) {

  file { '/etc/yum.repos.d/virtualbox.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template('yum/generic/virtualbox.erb'),
  }

}
