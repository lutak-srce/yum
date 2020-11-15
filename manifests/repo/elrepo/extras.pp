# Class: yum::repo::elrepo::extras
#
# This module manages ElRrepo Extras repo files for $operatingsystemrelease
#

# CentOS
class yum::repo::elrepo::extras (
  $priority  = '99',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::elrepo

  case $::operatingsystem {
    default : {}
    'CentOS' : {
      file { '/etc/yum.repos.d/elrepo-extras.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${facts['os']['name']}/${facts['os']['release']['major']}/elrepo-extras.erb"),
      }
    }
  }
}
