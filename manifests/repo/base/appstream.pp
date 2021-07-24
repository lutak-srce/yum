#
# = Class: yum::repo::base::appstream
#
# This module manages AppStream repo files for $operatingsystemrelease
#
class yum::repo::base::appstream (
  $priority  = '2',
  $exclude   = [],
  $include   = [],
  $baseurl = undef,
){

  require yum::repo::base

  file { "/etc/yum.repos.d/${facts['os']['name']}-AppStream.repo":
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/${facts['os']['name']}-AppStream.erb"),
  }

}
