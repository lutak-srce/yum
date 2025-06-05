#
# = Class: yum::repo::base::appstream
#
# This module manages AppStream repo files for $operatingsystemrelease
#
class yum::repo::base::appstream (
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

  case $facts['os']['release']['full'] {
    default: {
      $prefix = 'rocky-appstream'
    }
    /^8.*/: {
      $prefix = "${facts['os']['name']}-AppStream"
    }
  }

  file { "/etc/yum.repos.d/${prefix}.repo":
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/${prefix}.erb"),
  }

}
