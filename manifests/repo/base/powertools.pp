#
# = Class: yum::repo::base::powertools
#
# This module manages PoweTools repo files for $operatingsystemrelease
#

class yum::repo::base::powertools (
  $priority  = '2',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { "/etc/yum.repos.d/${facts['os']['name']}-PowerTools.repo":
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/${facts['os']['name']}-PowerTools.erb"),
  }

}
