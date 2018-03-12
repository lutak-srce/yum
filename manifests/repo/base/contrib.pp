# Class: yum::repo::base::contrib
#
# This module manages Contrib repo files for $operatingsystemrelease
#

# CentOS
class yum::repo::base::contrib (
  $priority  = '4',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  case $::operatingsystem {
    default : {}
    'CentOS' : {
      file { '/etc/yum.repos.d/CentOS-Contrib.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/CentOS-Contrib.erb"),
      }
    }
  }
}
