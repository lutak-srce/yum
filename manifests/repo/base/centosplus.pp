# Class: yum::repo::base::centosplus
#
# This module manages Extras repo files for $operatingsystemrelease
#

# CentOS
class yum::repo::base::centosplus (
  $priority  = '3',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  case $::operatingsystem {
    default : {}
    'CentOS' : {
      file { '/etc/yum.repos.d/CentOS-Plus.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/CentOS-Plus.erb"),
      }
    }
  }
}
