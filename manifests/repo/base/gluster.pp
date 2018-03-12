#
# = Class: yum::repo::base::gluster
#
# This module manages Gluster repo files for $operatingsystemrelease
#

# CentOS
class yum::repo::base::gluster (
  $priority  = '2',
  $version   = '3.12',
  $exclude   = [],
  $include   = [],
){

  case $::operatingsystem {
    default : {}
    'CentOS' : {
      file { "/etc/yum.repos.d/CentOS-Gluster-${version}.repo":
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/CentOS-Gluster.erb"),
      }
    }
  }

}
