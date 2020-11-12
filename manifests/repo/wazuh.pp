#
# = Class: yum::repo::wazuh
#
# This module manages Wazuh repo files for $lsbdistrelease
#
class yum::repo::wazuh (
  $priority  = '1',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
  $version   = '3',
) {

  require yum::repo::base

  file { '/etc/yum.repos.d/wazuh.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/wazuh.erb"),
  }

}
