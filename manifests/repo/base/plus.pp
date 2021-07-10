#
# = Class: yum::repo::base::plus
#
# This module manages Plus repo files for $operatingsystemrelease
#
class yum::repo::base::plus (
  $priority  = '3',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  case $facts['os']['name'] {
    default : {}
    /(CentOS|Rocky)/ : {
      file { "/etc/yum.repos.d/${facts['os']['name']}-Plus.repo":
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/${facts['os']['name']}-Plus.erb"),
      }
    }
  }

}
