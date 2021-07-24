#
# = Class: yum::repo::base::powertools
#
# This module manages PoweTools repo files for $operatingsystemrelease
#

class yum::repo::base::powertools (
  $priority  = '2',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  case $::operatingsystem {
    default : {}
    'CentOS' : {
      file { '/etc/yum.repos.d/CentOS-PowerTools.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/CentOS-PowerTools.erb"),
      }
    }
  }
}
