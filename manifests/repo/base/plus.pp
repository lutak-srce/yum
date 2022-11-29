#
# = Class: yum::repo::base::plus
#
# This module manages Plus repo files for $operatingsystemrelease
#
class yum::repo::base::plus (
  $priority       = '3',
  $exclude        = [],
  $include        = [],
  $baseurl        = undef,
  $baseurl_debug  = undef,
  $baseurl_source = undef,
  $debuginfo      = false,
  $source         = false,

){
  require yum::repo::base

  case $::operatingsystemrelease {
    default: {
      $prefix = 'rocky-plus'
    }
    /^8.*/: {
      $prefix = "${facts['os']['name']}-Plus"
    }
  }

  case $facts['os']['name'] {
    default : {}
    /(CentOS|Rocky)/ : {
      file { "/etc/yum.repos.d/${prefix}.repo":
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/${prefix}.erb"),
      }
    }
  }

}
