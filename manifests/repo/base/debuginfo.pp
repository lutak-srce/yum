#
# = Class: yum::repo::base::debuginfo
#
# This module manages Debuginfo repo files for $operatingsystemrelease
#
class yum::repo::base::debuginfo (
  $priority  = '2',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  case $facts['os']['name'] {
    default : {}
    /(CentOS|Rocky)/ : {
      file { "/etc/yum.repos.d/${facts['os']['name']}-Debuginfo.repo":
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/${facts['os']['name']}-Debuginfo.erb"),
      }
    }
  }

}
