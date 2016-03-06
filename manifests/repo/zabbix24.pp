# = Class: yum::repo::zabbix24
#
# This module manages Zabbix repo files for $lsbdistrelease
#
class yum::repo::zabbix24 (
  $stage     = 'yumsetup',
  $priority  = '1',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
) {
  file { '/etc/yum.repos.d/zabbix.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/zabbix24.erb"),
    require => Package['zabbix-release'],
  }

  # install package depending on major version
  case $::operatingsystemrelease {
    default: {}
    /^5.*/: {
      package { 'zabbix-release':
        ensure   => present,
        provider => 'rpm',
        source   => 'http://repo.zabbix.com/zabbix/2.4/rhel/5/x86_64/zabbix-release-2.4-1.el5.noarch.rpm',
      }
    }
    /^6.*/: {
      package { 'zabbix-release':
        ensure   => present,
        provider => 'rpm',
        source   => 'http://repo.zabbix.com/zabbix/2.4/rhel/6/x86_64/zabbix-release-2.4-1.el6.noarch.rpm',
      }
    }
  }
}
