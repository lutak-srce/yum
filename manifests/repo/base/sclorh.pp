#
# = Class: yum::repo::base::sclorh
#
# This module manages sclo-rh repo files for $operatingsystemrelease
#

# CentOS
class yum::repo::base::sclorh (
  $priority = '2',
  $exclude  = [],
  $include  = [],
){

  package { 'centos-release-scl-rh': }

  case $facts['os']['name'] {
    default : {}
    'CentOS' : {
      file { '/etc/yum.repos.d/CentOS-SCLo-scl-rh.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/CentOS-SCLo-scl-rh.erb"),
        require => Package['centos-release-scl-rh'],
      }
    }
  }

}
