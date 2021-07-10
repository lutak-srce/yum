#
# = Class: yum::repo::base::extras
#
# This module manages Extras repo files for $operatingsystemrelease
#
class yum::repo::base::extras (
  $priority  = '2',
  $exclude   = [],
  $include   = [],
  $baseurl   = undef,
  $debuginfo = false,
){
  require yum::repo::base

  case $facts['os']['name'] {
    default : {}
    /(CentOS|Rocky)/ : {
      file { "/etc/yum.repos.d/${facts['os']['name']}-Extras.repo":
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/${facts['os']['name']}-Extras.erb"),
      }
    }
  }

}
