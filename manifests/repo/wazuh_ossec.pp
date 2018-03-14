#
# = Class: yum::repo::wazuh_ossec
#
# This module manages Wazuh OSSEC repo files for $lsbdistrelease
#
class yum::repo::wazuh_ossec (
  $stage     = 'yumsetup',
  $priority  = '15',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
) {

  require yum::repo::base

  file { '/etc/yum.repos.d/wazuh_ossec.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/wazuh_ossec.erb"),
  }

}
