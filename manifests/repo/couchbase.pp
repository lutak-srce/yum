#
# = Class: yum::repo::couchbase
#
# This module manages Couchbase Server repo files for $lsbdistrelease
#
class yum::repo::couchbase (
  $stage     = 'yumsetup',
  $priority  = '11',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
  $source    = false,
){

  file { '/etc/yum.repos.d/couchbase-Base.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/couchbase-Base.erb"),
    require => Package['couchbase-release'],
  }

  package { 'couchbase-release':
    ensure   => present,
    provider => 'rpm',
    source   => 'http://packages.couchbase.com/releases/couchbase-release/couchbase-release-1.0-0-x86_64.rpm',
  }

}
