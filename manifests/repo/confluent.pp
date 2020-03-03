#
# = Class: yum::repo::confluent
#
# This module manages Confluent repo files for $lsbdistrelease
# https://docs.confluent.io/current/installation/installing_cp/rhel-centos.html#systemd-rhel-centos-install
#
class yum::repo::confluent (
  $priority  = '1',
  $exclude   = [],
  $include   = [],
  $version   = '5.1',
){
  require yum::repo::base

  file { '/etc/yum.repos.d/confluent.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template('yum/CentOS/confluent.erb'),
  }
}
