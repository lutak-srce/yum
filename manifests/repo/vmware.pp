#
# = Class: yum::repo::vmware
#
# This module manages vmware repo files for $operatingsystemrelease
#
class yum::repo::vmware (
  $priority     = '1',
  $exclude      = [],
  $include      = [],
  $esxi_version = '5.5latest',
  $version      = '9.4.12-1.el6',
){
  require ::yum::repo::base

  file { '/etc/yum.repos.d/vmware-osps.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/vmware-osps.erb"),
    require => Package['vmware-tools-repo-RHEL'],
  }
  package { 'vmware-tools-repo-RHEL':
    ensure   => $version,
    name     => "vmware-tools-repo-RHEL${facts['os']['release']['major']}",
    provider => 'rpm',
    source   => "http://packages.vmware.com/tools/esx/${esxi_version}/repos/vmware-tools-repo-RHEL${facts['os']['release']['major']}-${version}.${facts['os']['architecture']}.rpm",
  }
}
