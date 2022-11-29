#
# = Class: yum::repo::base::crb
#
# This module manages CRB repo files for $operatingsystemrelease
#
class yum::repo::base::crb (
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

  file { "/etc/yum.repos.d/rocky-crb.repo":
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/rocky-crb.erb"),
  }

}
