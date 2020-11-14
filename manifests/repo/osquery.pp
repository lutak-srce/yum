#
# = Class: yum::repo::osquery
#
# This module manages osquery repo files for $lsbdistrelease
#
class yum::repo::osquery (
  $priority  = '1',
  $exclude   = [],
  $include   = [],
  $baseurl   = undef,
) {

  require yum::repo::base

  file { '/etc/yum.repos.d/osquery-s3-rpm.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/osquery-s3-rpm.erb"),
  }

}
