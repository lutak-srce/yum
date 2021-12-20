#
# Class: yum::repo::ocsinventory
#
# This module manages OCS Inventory NG repository
#

# CentOS
class yum::repo::ocsinventory (
  $priority  = '1',
  $exclude   = [],
  $include   = [],
){

  File {
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
  }

  file { '/etc/yum.repos.d/ocsinventory.repo':
    content => template('yum/generic/ocsinventory.erb'),
  }

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-ocs':
    source => 'puppet:///modules/yum/keys/RPM-GPG-KEY-ocs',
  }

}
