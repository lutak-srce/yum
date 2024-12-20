# Class: yum::repo::zabbix::frontend
#
# This module manages Zabbix repo files for $operatingsystemrelease
#

# CentOS
class yum::repo::zabbix::frontend (
  $priority  = '1',
  $exclude   = [],
  $include   = [],
){
  require yum::repo::zabbix

  $version = $yum::repo::zabbix::version

  case $facts['os']['name'] {
    default : {}
    'CentOS' : {
      file { '/etc/yum.repos.d/zabbix-frontend.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${facts['os']['name']}/zabbix-frontend.erb"),
      }
    }
  }
}
