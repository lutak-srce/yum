#
# = Class: yum::repo::base::ovirt
#
# This module manages oVirt repo files for $operatingsystemrelease
#

# CentOS
class yum::repo::base::ovirt (
  $priority  = '2',
  $version   = '4.2',
  $exclude   = [],
  $include   = [],
  $testing   = false,
){

  $version_nodot = regsubst($version, '\.', '')

  package { "centos-release-ovirt${version_nodot}": }

  case $::operatingsystem {
    default : {}
    'CentOS' : {
      file { "/etc/yum.repos.d/CentOS-oVirt-${version}.repo":
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/CentOS-oVirt.erb"),
	require => Package["centos-release-ovirt${version_nodot}"],
      }
    }
  }
}
