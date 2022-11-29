#
# = Class: yum::repo::base::addons
#
# This module manages addons repo files for $operatingsystemrelease
#
class yum::repo::base::addons (
  $priority  = '2',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
  $source    = false,
){

  require yum::repo::base

  file { "/etc/yum.repos.d/rocky-addons.repo":
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/rocky-addons.erb"),
  }

}
