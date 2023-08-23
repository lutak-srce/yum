#
# = Class: yum::repo::base::devel
#
# This module manages devel repo files for $operatingsystemrelease
#
class yum::repo::base::devel (
  $priority = '1',
  $exclude  = [],
  $include  = [],
  $baseurl  = undef,
  $devel    = false,
){
  require yum::repo::base

  case $facts['os']['name'] {
    default : {}
    /(CentOS|Rocky)/ : {
      file { "/etc/yum.repos.d/${facts['os']['name']}-Devel.repo":
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/${facts['os']['name']}-Devel.erb"),
      }
    }
  }

}
