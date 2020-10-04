# Class: yum::repo::base::extras
#
# This module manages Extras repo files for $operatingsystemrelease
#

# CentOS
class yum::repo::base::extras (
  $priority  = '2',
  $exclude   = [],
  $include   = [],
  $baseurl   = undef,
  $debuginfo = false,
){
  require yum::repo::base

  case $::operatingsystem {
    default : {}
    'CentOS' : {
      file { '/etc/yum.repos.d/CentOS-Extras.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/CentOS-Extras.erb"),
      }
    }
  }
}
