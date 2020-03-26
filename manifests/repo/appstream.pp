#
# = Class: yum::repo::appstream
#
# This module manages AppStream repo files for $operatingsystemrelease
#
class yum::repo::appstream (
  $priority  = '2',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){

  require yum::repo::base

  case $::operatingsystem {
    default : {}
    'CentOS' : {
      file { '/etc/yum.repos.d/CentOS-AppStream.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/CentOS-AppStream.erb"),
      }
    }
  }

}
