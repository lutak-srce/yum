# = Class: yum::repo::zabbix
#
# This module manages Zabbix repo files for $lsbdistrelease
#
class yum::repo::zabbix (
  $stage     = 'yumsetup',
  $priority  = '1',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
  $version   = '2.2',
) {
  file { '/etc/yum.repos.d/zabbix.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/zabbix.erb"),
    require => Package['zabbix-release'],
  }

  # install package depending on major version
  case $::operatingsystemrelease {
    default: {}
    /^5.*/: {
      package { 'zabbix-release':
        ensure   => present,
        provider => 'rpm',
        source   => "http://repo.zabbix.com/zabbix/${version}/rhel/5/x86_64/zabbix-release-${version}-1.el5.noarch.rpm",
      }
    }
    /^6.*/: {
      package { 'zabbix-release':
        ensure   => present,
        provider => 'rpm',
        source   => "http://repo.zabbix.com/zabbix/${version}/rhel/6/x86_64/zabbix-release-${version}-1.el6.noarch.rpm",
      }
    }
    /^7.*/: {
      package { 'zabbix-release':
        ensure   => present,
        provider => 'rpm',
        source   => "http://repo.zabbix.com/zabbix/${version}/rhel/7/x86_64/zabbix-release-${version}-1.el7.noarch.rpm",
      }
    }
  }
}
