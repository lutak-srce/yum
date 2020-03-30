#
# = Class: yum::repo::base::openstack
#
# This module manages OpenStack repo files
#
class yum::repo::base::openstack (
  $version   = 'stein',
  $priority  = '1',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){

  require ::yum::repo::base
  require ::yum::repo::base::extras

  File {
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0644',
  }

  package { "centos-release-openstack-${version}":
    ensure => present,
  }

  file { "/etc/yum.repos.d/CentOS-OpenStack-${version}.repo":
    ensure  => file,
    content => template('yum/CentOS/CentOS-OpenStack.erb'),
  }

}
