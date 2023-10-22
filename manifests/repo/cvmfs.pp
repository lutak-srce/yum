# = Class: yum::repo::cvmfs
#
# This module manages CERN cvmfs repo files for $lsbdistrelease
#
class yum::repo::cvmfs (
  $priority  = '1',
  $exclude   = [ ],
  $debuginfo = false,
) {
  file { '/etc/yum.repos.d/cvmfs.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template('yum/generic/cvmfs.erb'),
  }

}
