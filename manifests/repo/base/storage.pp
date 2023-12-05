#
# = Class: yum::repo::base::storage
#
# This module manages Storage Common repo files for $operatingsystemrelease
#

class yum::repo::base::storage (
  $priority = '2',
  $exclude  = [],
  $include  = [],
  $baseurl  = undef,
){

  require yum::repo::base::extras

  package { 'centos-release-storage-common': }

  case $facts['os']['name'] {
    default : {}

    'Rocky' : {
      file { '/etc/yum.repos.d/CentOS-Storage-common.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/CentOS-Storage-common.erb"),
        require => Package['centos-release-storage-common'],
      }
    }

  }

}
