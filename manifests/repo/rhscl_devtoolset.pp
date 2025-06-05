#
# = Class: yum::repo::rhscl_devtoolset
#
# This class manages RHEL Software Collection devtoolset repo files for $lsbdistrelease
#
class yum::repo::rhscl_devtoolset (
  $priority  = '1',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
) {
  file { '/etc/yum.repos.d/rhscl-devtoolset.repo':
    ensure => file,
    mode   => '0644',
    owner  => root,
    group  => root,
    source =>  "puppet:///modules/yum/${facts['os']['name']}/${facts['os']['release']['full']}/rhscl-devtoolset.repo",
  }
}
