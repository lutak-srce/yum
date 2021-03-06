#
# = Class: yum::repo::base::opstools
#
# This module manages OpsTools repo files for $operatingsystemrelease
#

# CentOS
class yum::repo::base::opstools (
  $priority  = '2',
  $exclude   = [],
  $include   = [],
){

  case $::operatingsystem {
    default : {}
    'CentOS' : {
      file { '/etc/yum.repos.d/CentOS-OpsTools.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/CentOS-OpsTools.erb"),
      }
    }
  }

}
