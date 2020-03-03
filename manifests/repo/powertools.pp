# Class: yum::repo::base::powertools
#
# This module manages Extras repo files for $operatingsystemrelease
#

# CentOS
class yum::repo::powertools (
  $stage     = 'yumsetup',
  $priority  = '2',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  case $::operatingsystem {
    default : {}
    'CentOS' : {
      file { '/etc/yum.repos.d/CentOS-PowerTools.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/CentOS-PowerTools.erb"),
      }
    }
  }
}
