#
# = Class: yum::repo::remi::php82
#
# This module manages Remi php82 repo files for $lsbdistrelease
#
class yum::repo::remi::php82 (
  $priority       = '91',
  $exclude        = [],
  $include        = [],
  $debuginfo      = false,
  $test           = false,
  $test_debuginfo = false,
) {

  require yum::repo::remi

  file { '/etc/yum.repos.d/remi-php82.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${facts['os']['name']}/remi-php82.erb"),
  }

}
