#
# = Class: yum::repo::zabbix
#
# This module manages Zabbix repo files for $lsbdistrelease
#
class yum::repo::zabbix (
  $priority  = '1',
  $version   = '3.2',
  $release   = '1',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
) {

  file { '/etc/yum.repos.d/zabbix.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/zabbix.erb"),
    require => Package['zabbix-release'],
  }

  # install package depending on major version
  package { 'zabbix-release':
    provider => 'rpm',
    source   => "https://repo.zabbix.com/zabbix/${version}/rhel/${facts['os']['release']['major']}/x86_64/zabbix-release-${version}-${release}.el${facts['os']['release']['major']}.noarch.rpm",
  }

}
