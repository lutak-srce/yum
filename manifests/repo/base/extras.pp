#
# = Class: yum::repo::base::extras
#
# This module manages Extras repo files for $operatingsystemrelease
#
class yum::repo::base::extras (
  $priority       = '2',
  $exclude        = [],
  $include        = [],
  $baseurl        = undef,
  $baseurl_debug  = undef,
  $baseurl_source = undef,
  $debuginfo      = false,
  $source         = false,
){
  require yum::repo::base

  case $facts['os']['release']['major'] {
    default: {
      $prefix = "${facts['os']['name']}-Extras"
    }
    /^9.*/: {
      $prefix = 'rocky-extras'
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
