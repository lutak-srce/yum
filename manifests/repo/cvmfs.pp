# = Class: yum::repo::cvmfs
#
# This module manages CERN cvmfs repo files for $lsbdistrelease
#
class yum::repo::cvmfs (
  $priority  = '1',
  $exclude   = [ ],
  $debuginfo = false,
) {
  file { '/etc/yum.repos.d/cernvm.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/cernvm.erb"),
    require => Package['cvmfs-release'],
  }

  # install package depending on major version
  case $::operatingsystemrelease {
    default: {}
    /^5.*/: {
      package { 'cvmfs-release':
        ensure   => present,
        provider => 'rpm',
        source   => 'http://cvmrepo.web.cern.ch/cvmrepo/yum/cvmfs/EL/5/x86_64/cvmfs-release-2-4.el5.noarch.rpm',
      }
    }
    /^6.*/: {
      package { 'cvmfs-release':
        ensure   => present,
        provider => 'rpm',
        source   => 'http://cvmrepo.web.cern.ch/cvmrepo/yum/cvmfs/EL/6/x86_64/cvmfs-release-2-4.el6.noarch.rpm',
      }
    }
  }
}
