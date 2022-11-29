#
# = Class: yum::repo::remi
#
# This module manages Remi repo files for $lsbdistrelease
#
class yum::repo::remi (
  $priority       = '91',
  $exclude        = [],
  $include        = [],
  $remi           = false,
  $test           = false,
  $debuginfo      = false,
  $test_debuginfo = false,
) {
  file { '/etc/yum.repos.d/remi.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/remi.erb"),
    require => Package['remi-release'],
  }
  package { 'remi-release' :
    ensure   => present,
    provider => 'rpm',
    source   => "http://rpms.famillecollet.com/enterprise/remi-release-${facts['os']['release']['major']}.rpm",
  }
}
